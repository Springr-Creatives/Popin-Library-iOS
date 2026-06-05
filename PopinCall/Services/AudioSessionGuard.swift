//
//  AudioSessionGuard.swift
//  PopinCall
//
//  Created by Ashwin Nath.
//
//  Monitors the shared `AVAudioSession` during an active call and re-asserts
//  the correct category/mode/options whenever another library hijacks it.
//
//  Ownership: Singleton, retained by `CallManager` (which owns the `CXProvider`).
//  Call `startGuarding()` when a call begins and `stopGuarding()` when it ends.
//
//  CallKit contract: While `isCallKitManagingSession` is `true`, the guard
//  will never call `setActive(true)` — only re-assert category/mode/options.
//  The one exception is `handleMediaServicesReset`, where the session is
//  invalidated by iOS and must be fully rebuilt regardless of CallKit state.
//

import Foundation

#if canImport(UIKit)
import AVFoundation
import LiveKit

final class AudioSessionGuard {

    // MARK: - Singleton

    static let shared = AudioSessionGuard()

    // MARK: - State

    /// True while CallKit owns the audio session (between didActivate/didDeactivate).
    /// When true, we re-assert category but never call setActive(true).
    private(set) var isCallKitManagingSession: Bool = false

    /// True while the guard is actively observing notifications.
    private(set) var isGuarding: Bool = false

    /// Periodic check that catches hijacks when no notification fires (e.g. competing app exits).
    private var heartbeatTimer: Timer?
    private let heartbeatInterval: TimeInterval = 3.0

    // MARK: - Target Configuration

    private let targetCategory: AVAudioSession.Category = .playAndRecord
    private let targetMode: AVAudioSession.Mode = .videoChat
    private let targetOptions: AVAudioSession.CategoryOptions = [
        .mixWithOthers,
        .allowBluetooth,
        .allowBluetoothA2DP,
        .defaultToSpeaker,
        .allowAirPlay
    ]
    private let targetSampleRate: Double = 48000.0

    // MARK: - Init

    private init() {}

    // MARK: - Debug

    /// Dumps the full audio session state for debugging.
    func dumpSessionState(label: String) {
        let s = AVAudioSession.sharedInstance()
        print("[\(label)] ─────────────────────────────────")
        print("  category:          \(s.category.rawValue)")
        print("  mode:              \(s.mode.rawValue)")
        print("  categoryOptions:   \(s.categoryOptions.rawValue)")
        print("  isOtherAudioPlaying: \(s.isOtherAudioPlaying)")
        print("  sampleRate:        \(s.sampleRate)")
        print("  preferredSampleRate: \(s.preferredSampleRate)")
        print("  inputChannels:     \(s.inputNumberOfChannels)")
        print("  outputChannels:    \(s.outputNumberOfChannels)")
        print("  outputVolume:      \(s.outputVolume)")
        print("  inputAvailable:    \(s.isInputAvailable)")

        let inputs = s.currentRoute.inputs.map { "\($0.portType.rawValue)(\($0.portName))" }.joined(separator: ", ")
        let outputs = s.currentRoute.outputs.map { "\($0.portType.rawValue)(\($0.portName))" }.joined(separator: ", ")
        print("  route.inputs:      \(inputs.isEmpty ? "NONE" : inputs)")
        print("  route.outputs:     \(outputs.isEmpty ? "NONE" : outputs)")

        print("  isCallKitManaging: \(isCallKitManagingSession)")
        print("  isGuarding:        \(isGuarding)")
        print("─────────────────────────────────────────────────")
    }

    // MARK: - Public API

    /// Begin observing audio-session notifications. Idempotent.
    func startGuarding() {
        guard !isGuarding else {
            PopinLogger.shared.log("AudioSessionGuard: startGuarding called but already guarding, skipping")
            return
        }
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

        PopinLogger.shared.log("AudioSessionGuard: started guarding (callKitManaging: \(isCallKitManagingSession))")
        logCurrentSessionState(context: "startGuarding")
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

    // MARK: - CallKit Session Events

    /// Called from `CXProviderDelegate.provider(_:didActivate:)`.
    func sessionDidActivate() {
        isCallKitManagingSession = true
        PopinLogger.shared.log("AudioSessionGuard: CallKit did activate session (isGuarding: \(isGuarding))")
        dumpSessionState(label: "sessionDidActivate")
    }

    /// Called from `CXProviderDelegate.provider(_:didDeactivate:)`.
    func sessionDidDeactivate() {
        isCallKitManagingSession = false
        PopinLogger.shared.log("AudioSessionGuard: CallKit did deactivate session (isGuarding: \(isGuarding))")
    }

    // MARK: - Reassertion

    /// Re-asserts the correct audio session configuration for video calls.
    /// Does NOT call setActive(true) — CallKit owns session activation for all calls.
    func reassertAudioSession() {
        let session = AVAudioSession.sharedInstance()

        PopinLogger.shared.log("AudioSessionGuard: reassertAudioSession BEGIN — callKitManaging: \(isCallKitManagingSession)")
        logCurrentSessionState(context: "reassert-before")

        do {
            try session.setCategory(targetCategory, mode: targetMode, options: targetOptions)
            PopinLogger.shared.log("AudioSessionGuard: setCategory success")
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: setCategory FAILED: \(error)")
            return
        }

        do {
            try session.setPreferredSampleRate(targetSampleRate)
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: setPreferredSampleRate FAILED: \(error)")
        }

        do {
            try session.overrideOutputAudioPort(.speaker)
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: overrideOutputAudioPort FAILED: \(error)")
        }

        // Do NOT call setActive(true) — CallKit owns session activation for all calls.

        do {
            try AudioManager.shared.setEngineAvailability(.default)
            PopinLogger.shared.log("AudioSessionGuard: setEngineAvailability(.default) success")
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: setEngineAvailability(.default) FAILED: \(error)")
            return
        }

        logCurrentSessionState(context: "reassert-after")
        PopinLogger.shared.log("AudioSessionGuard: reassertAudioSession COMPLETE")
    }

    // MARK: - Notification Handlers

    @objc private func handleInterruption(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            PopinLogger.shared.log("AudioSessionGuard: interruption notification with missing/invalid type key")
            return
        }

        switch type {
        case .began:
            let wasSuspended = userInfo[AVAudioSessionInterruptionWasSuspendedKey] as? Bool ?? false
            PopinLogger.shared.log("AudioSessionGuard: interruption BEGAN (wasSuspended: \(wasSuspended), callKitManaging: \(isCallKitManagingSession))")
            logCurrentSessionState(context: "interruption-began")

        case .ended:
            let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt ?? 0
            let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
            let shouldResume = options.contains(.shouldResume)

            PopinLogger.shared.log("AudioSessionGuard: interruption ENDED (shouldResume: \(shouldResume), optionsRaw: \(optionsValue), callKitManaging: \(isCallKitManagingSession))")
            logCurrentSessionState(context: "interruption-ended-before-reassert")

            if shouldResume {
                PopinLogger.shared.log("AudioSessionGuard: shouldResume=true, calling reassertAudioSession")
                reassertAudioSession()
            } else {
                PopinLogger.shared.log("AudioSessionGuard: shouldResume=false, NOT reasserting — audio may remain broken. Check if another interruption or CallKit event restores it.")
            }

        @unknown default:
            PopinLogger.shared.log("AudioSessionGuard: unknown interruption type: \(typeValue)")
        }
    }

    @objc private func handleRouteChange(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let reasonValue = userInfo[AVAudioSessionRouteChangeReasonKey] as? UInt,
              let reason = AVAudioSession.RouteChangeReason(rawValue: reasonValue) else {
            PopinLogger.shared.log("AudioSessionGuard: route change notification with missing/invalid reason key")
            return
        }

        let session = AVAudioSession.sharedInstance()
        let reasonName = routeChangeReasonName(reason)

        PopinLogger.shared.log("AudioSessionGuard: route change — reason: \(reasonName) (\(reasonValue)), category: \(session.category.rawValue), mode: \(session.mode.rawValue)")

        if let previousRoute = userInfo[AVAudioSessionRouteChangePreviousRouteKey] as? AVAudioSessionRouteDescription {
            let prevOutputs = previousRoute.outputs.map { "\($0.portName) (\($0.portType.rawValue))" }.joined(separator: ", ")
            let prevInputs = previousRoute.inputs.map { "\($0.portName) (\($0.portType.rawValue))" }.joined(separator: ", ")
            PopinLogger.shared.log("AudioSessionGuard: route change — previousRoute inputs: [\(prevInputs)], outputs: [\(prevOutputs)]")
        }

        logCurrentRoute(context: "route-change-current")

        switch reason {
        case .categoryChange:
            if session.category != targetCategory {
                PopinLogger.shared.log("AudioSessionGuard: HIJACK DETECTED via route change — current category: \(session.category.rawValue), expected: \(targetCategory.rawValue), mode: \(session.mode.rawValue), options: \(session.categoryOptions.rawValue)")
                reassertAudioSession()
            } else if session.mode != targetMode {
                PopinLogger.shared.log("AudioSessionGuard: route change categoryChange — category matches but mode differs: current=\(session.mode.rawValue), expected=\(targetMode.rawValue). Reasserting.")
                reassertAudioSession()
            } else {
                PopinLogger.shared.log("AudioSessionGuard: route change categoryChange — category and mode match, no action needed")
            }

        case .oldDeviceUnavailable:
            // A competing app (e.g. Google Meet) released its audio route, or a Bluetooth device disconnected.
            // iOS does NOT re-trigger didActivateAudioSession — we must reclaim manually.
            PopinLogger.shared.log("AudioSessionGuard: oldDeviceUnavailable — competing app may have released session. Checking if reassertion needed.")
            reassertIfNeeded()

        case .unknown:
            // iOS sometimes fires .unknown when a competing app exits or the session state changes silently.
            PopinLogger.shared.log("AudioSessionGuard: route change with unknown reason during active call. Checking if reassertion needed.")
            reassertIfNeeded()

        default:
            // Other reasons (newDeviceAvailable, override, wakeFromSleep, etc.) — no action needed
            break
        }
    }

    @objc private func handleMediaServicesReset(_ notification: Notification) {
        PopinLogger.shared.log("AudioSessionGuard: MEDIA SERVICES RESET — entire audio subsystem was restarted by iOS. Rebuilding session. (callKitManaging: \(isCallKitManagingSession))")

        // After a media services reset, the audio session is invalid.
        // We must fully reconfigure and reactivate regardless of CallKit state.
        let session = AVAudioSession.sharedInstance()

        do {
            try session.setCategory(targetCategory, mode: targetMode, options: targetOptions)
            PopinLogger.shared.log("AudioSessionGuard: media reset — setCategory success")
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: media reset — setCategory FAILED: \(error)")
            return
        }

        do {
            try session.setPreferredSampleRate(targetSampleRate)
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: media reset — setPreferredSampleRate FAILED: \(error)")
        }

        do {
            try session.overrideOutputAudioPort(.speaker)
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: media reset — overrideOutputAudioPort FAILED: \(error)")
        }

        do {
            try session.setActive(true)
            PopinLogger.shared.log("AudioSessionGuard: media reset — setActive(true) success")
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: media reset — setActive(true) FAILED: \(error)")
            return
        }

        do {
            try AudioManager.shared.setEngineAvailability(.default)
            PopinLogger.shared.log("AudioSessionGuard: media reset — setEngineAvailability(.default) success")
        } catch {
            PopinLogger.shared.log("AudioSessionGuard: media reset — setEngineAvailability(.default) FAILED: \(error)")
            return
        }

        logCurrentSessionState(context: "media-reset-after")
        PopinLogger.shared.log("AudioSessionGuard: media services reset recovery COMPLETE")
    }

    /// Fires when another app's audio stops (e.g. Google Meet hangs up).
    /// This is the most reliable signal that a competing app released the session.
    @objc private func handleSecondaryAudioHint(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let typeValue = userInfo[AVAudioSessionSilenceSecondaryAudioHintTypeKey] as? UInt,
              let type = AVAudioSession.SilenceSecondaryAudioHintType(rawValue: typeValue) else {
            PopinLogger.shared.log("AudioSessionGuard: silenceSecondaryAudioHint with missing/invalid type key")
            return
        }

        switch type {
        case .begin:
            PopinLogger.shared.log("AudioSessionGuard: secondary audio BEGAN (another app started playing)")

        case .end:
            PopinLogger.shared.log("AudioSessionGuard: secondary audio ENDED — another app stopped. Reasserting session to reclaim audio.")
            reassertAudioSession()

        @unknown default:
            PopinLogger.shared.log("AudioSessionGuard: unknown secondary audio hint type: \(typeValue)")
        }
    }

    // MARK: - Conditional Reassertion

    /// Only reasserts if the session is not already in the correct state.
    /// Used for route changes where we're not sure if it's a hijack.
    private func reassertIfNeeded() {
        let session = AVAudioSession.sharedInstance()
        if session.category != targetCategory || session.mode != targetMode {
            PopinLogger.shared.log("AudioSessionGuard: reassertIfNeeded — session drifted (category: \(session.category.rawValue), mode: \(session.mode.rawValue)). Reasserting.")
            reassertAudioSession()
        } else {
            // Even if category/mode match, the audio engine may have been disrupted.
            // Re-poke the engine availability to ensure LiveKit is still connected.
            PopinLogger.shared.log("AudioSessionGuard: reassertIfNeeded — category/mode OK, re-poking engine availability")
            do {
                try AudioManager.shared.setEngineAvailability(.default)
                PopinLogger.shared.log("AudioSessionGuard: reassertIfNeeded — setEngineAvailability(.default) success")
            } catch {
                PopinLogger.shared.log("AudioSessionGuard: reassertIfNeeded — setEngineAvailability FAILED: \(error). Falling back to full reassert.")
                reassertAudioSession()
            }
        }
    }

    // MARK: - Heartbeat

    /// Starts a periodic check that catches session hijacking when no notification fires.
    /// This handles edge cases like a competing app (Google Meet) exiting without triggering
    /// interruptionEnded or silenceSecondaryAudioHint.
    private func startHeartbeat() {
        stopHeartbeat()
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.heartbeatTimer = Timer.scheduledTimer(withTimeInterval: self.heartbeatInterval, repeats: true) { [weak self] _ in
                self?.heartbeatCheck()
            }
            PopinLogger.shared.log("AudioSessionGuard: heartbeat started (interval: \(self.heartbeatInterval)s)")
        }
    }

    private func stopHeartbeat() {
        DispatchQueue.main.async { [weak self] in
            self?.heartbeatTimer?.invalidate()
            self?.heartbeatTimer = nil
        }
    }

    private func heartbeatCheck() {
        guard isGuarding else { return }

        let session = AVAudioSession.sharedInstance()
        if session.category != targetCategory || session.mode != targetMode {
            PopinLogger.shared.log("AudioSessionGuard: HEARTBEAT detected drifted session — category: \(session.category.rawValue) (expected: \(targetCategory.rawValue)), mode: \(session.mode.rawValue) (expected: \(targetMode.rawValue)). Reasserting.")
            reassertAudioSession()
        }
    }

    // MARK: - Diagnostics

    /// Logs a snapshot of the current audio session state for debugging.
    private func logCurrentSessionState(context: String) {
        let session = AVAudioSession.sharedInstance()
        PopinLogger.shared.log("AudioSessionGuard [\(context)]: category=\(session.category.rawValue), mode=\(session.mode.rawValue), options=\(session.categoryOptions.rawValue), sampleRate=\(session.sampleRate), preferredSampleRate=\(session.preferredSampleRate), isOtherAudioPlaying=\(session.isOtherAudioPlaying), outputVolume=\(session.outputVolume)")
        logCurrentRoute(context: context)
    }

    /// Logs the current input/output route for debugging.
    private func logCurrentRoute(context: String) {
        let session = AVAudioSession.sharedInstance()
        let route = session.currentRoute
        let inputs = route.inputs.map { "\($0.portName) (\($0.portType.rawValue))" }.joined(separator: ", ")
        let outputs = route.outputs.map { "\($0.portName) (\($0.portType.rawValue))" }.joined(separator: ", ")
        PopinLogger.shared.log("AudioSessionGuard [\(context)]: route inputs: [\(inputs)], outputs: [\(outputs)]")
    }

    /// Human-readable name for route change reasons (rawValue alone is not helpful in logs).
    private func routeChangeReasonName(_ reason: AVAudioSession.RouteChangeReason) -> String {
        switch reason {
        case .unknown: return "unknown"
        case .newDeviceAvailable: return "newDeviceAvailable"
        case .oldDeviceUnavailable: return "oldDeviceUnavailable"
        case .categoryChange: return "categoryChange"
        case .override: return "override"
        case .wakeFromSleep: return "wakeFromSleep"
        case .noSuitableRouteForCategory: return "noSuitableRouteForCategory"
        case .routeConfigurationChange: return "routeConfigurationChange"
        @unknown default: return "unknown(\(reason.rawValue))"
        }
    }

    deinit {
        heartbeatTimer?.invalidate()
        NotificationCenter.default.removeObserver(self)
    }
}

#endif
