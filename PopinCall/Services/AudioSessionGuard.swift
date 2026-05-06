//
//  AudioSessionGuard.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//

import Foundation

#if canImport(UIKit)
import AVFoundation
import LiveKit

/// Monitors the shared `AVAudioSession` during an active call and re-asserts
/// the correct category/mode/options whenever another library hijacks it.
///
/// **Ownership:** Created and retained by `CallManager` (which owns the `CXProvider`).
/// Call `startGuarding()` when a call begins and `stopGuarding()` when it ends.
///
/// **CallKit contract:** While `isCallKitManagingSession` is `true`, the guard
/// will never call `setActive(true)` — only re-assert category/mode/options.
final class AudioSessionGuard {

    // MARK: - Singleton

    static let shared = AudioSessionGuard()

    // MARK: - State

    /// Set to `true` in `provider(_:didActivateAudioSession:)`,
    /// `false` in `provider(_:didDeactivateAudioSession:)`.
    private(set) var isCallKitManagingSession: Bool = false

    /// Whether the guard is actively observing notifications.
    private(set) var isGuarding: Bool = false

    /// Periodic check that re-asserts the session if another app silently stole it.
    private var heartbeatTimer: Timer?

    // MARK: - Init

    private init() {}

    // MARK: - Public API

    /// Begin observing audio-session notifications. Idempotent.
    func startGuarding() {
        guard !isGuarding else { return }
        isGuarding = true

        let nc = NotificationCenter.default
        nc.addObserver(self,
                       selector: #selector(handleInterruption(_:)),
                       name: AVAudioSession.interruptionNotification,
                       object: AVAudioSession.sharedInstance())
        nc.addObserver(self,
                       selector: #selector(handleRouteChange(_:)),
                       name: AVAudioSession.routeChangeNotification,
                       object: AVAudioSession.sharedInstance())
        nc.addObserver(self,
                       selector: #selector(handleMediaServicesReset(_:)),
                       name: AVAudioSession.mediaServicesWereResetNotification,
                       object: nil)
        nc.addObserver(self,
                       selector: #selector(handleSecondaryAudioHint(_:)),
                       name: AVAudioSession.silenceSecondaryAudioHintNotification,
                       object: nil)

        startHeartbeat()
        PopinLogger.shared.log("AudioSessionGuard: started guarding")
    }

    /// Stop observing. Call when the call ends.
    func stopGuarding() {
        guard isGuarding else { return }
        isGuarding = false
        isCallKitManagingSession = false
        stopHeartbeat()
        NotificationCenter.default.removeObserver(self)
        PopinLogger.shared.log("AudioSessionGuard: stopped guarding")
    }

    /// Called from `CXProviderDelegate.provider(_:didActivate:)`.
    func sessionDidActivate() {
        isCallKitManagingSession = true
        PopinLogger.shared.log("AudioSessionGuard: CallKit activated session")
    }

    /// Called from `CXProviderDelegate.provider(_:didDeactivate:)`.
    func sessionDidDeactivate() {
        isCallKitManagingSession = false
        PopinLogger.shared.log("AudioSessionGuard: CallKit deactivated session")
    }

    /// Re-assert the correct audio-session configuration for a video call.
    /// Safe to call at any time — skips `setActive(true)` while CallKit owns the session.
    func reassertAudioSession() {
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(
                .playAndRecord,
                mode: .videoChat,
                options: [.allowBluetooth, .allowBluetoothA2DP, .defaultToSpeaker, .allowAirPlay]
            )
            try session.setPreferredSampleRate(48_000)
            try session.overrideOutputAudioPort(.speaker)

            // Only activate if CallKit is NOT managing the session.
            // When CallKit is active it already called setActive(true) for us.
            if !isCallKitManagingSession {
                try session.setActive(true, options: [])
            }

            // Re-enable LiveKit audio engine
            try AudioManager.shared.setEngineAvailability(.default)

            PopinLogger.shared.log("AudioSessionGuard: reassertAudioSession succeeded (callKitManaging=\(isCallKitManagingSession))")
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: reassertAudioSession FAILED: \(error)")
        }
    }

    // MARK: - Notification Handlers

    @objc private func handleInterruption(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
        }

        switch type {
        case .began:
            PopinLogger.shared.log("AudioSessionGuard: interruption BEGAN")

        case .ended:
            let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt ?? 0
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)

            if options.contains(.shouldResume) {
                PopinLogger.shared.log("AudioSessionGuard: interruption ENDED with shouldResume — reasserting")
                reassertAudioSession()
            } else {
                PopinLogger.shared.log("AudioSessionGuard: interruption ENDED (no shouldResume flag)")
            }

        @unknown default:
            break
        }
    }

    @objc private func handleRouteChange(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
              let reason = AVAudioSession.RouteChangeReason(rawValue: reasonValue) else {
            return
        }

        let session = AVAudioSession.sharedInstance()

        switch reason {
        case .categoryChange:
            // Another library called setCategory — check if we've been knocked off .playAndRecord.
            if session.category != .playAndRecord {
                PopinLogger.shared.log("AudioSessionGuard: category HIJACKED to \(session.category.rawValue) — reasserting")
                reassertAudioSession()
            }

        case .oldDeviceUnavailable:
            // A device (e.g. Bluetooth) was removed, or a competing app released audio hardware.
            PopinLogger.shared.log("AudioSessionGuard: route change oldDeviceUnavailable — reasserting")
            reassertAudioSession()

        case .unknown:
            // iOS sometimes fires .unknown when a competing app exits.
            if isCallKitManagingSession {
                PopinLogger.shared.log("AudioSessionGuard: route change unknown during active call — reasserting")
                reassertAudioSession()
            }

        default:
            break
        }
    }

    @objc private func handleMediaServicesReset(_ notification: Notification) {
        // Media services died and restarted — the audio session is completely invalidated.
        // Rebuild from scratch.
        PopinLogger.shared.log("AudioSessionGuard: media services RESET — full rebuild")
        reassertAudioSession()
    }

    /// Fires when another app's audio stops (e.g. Google Meet hangs up).
    /// This is the most reliable signal that a competing app released the session.
    @objc private func handleSecondaryAudioHint(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionSilenceSecondaryAudioHintTypeKey] as? UInt,
              let type = AVAudioSession.SilenceSecondaryAudioHintType(rawValue: typeValue) else {
            return
        }

        if type == .end {
            PopinLogger.shared.log("AudioSessionGuard: secondary audio ENDED (competing app stopped) — reasserting")
            reassertAudioSession()
        }
    }

    // MARK: - Heartbeat

    /// Polls every 3 seconds to catch cases where no notification fires
    /// (e.g. a competing app silently releases the session).
    private func startHeartbeat() {
        stopHeartbeat()
        heartbeatTimer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            guard let self, self.isCallKitManagingSession else { return }
            let session = AVAudioSession.sharedInstance()
            if session.category != .playAndRecord || session.mode != .videoChat {
                PopinLogger.shared.log("AudioSessionGuard: heartbeat detected wrong category=\(session.category.rawValue) mode=\(session.mode.rawValue) — reasserting")
                self.reassertAudioSession()
            }
        }
    }

    private func stopHeartbeat() {
        heartbeatTimer?.invalidate()
        heartbeatTimer = nil
    }
}

#endif
