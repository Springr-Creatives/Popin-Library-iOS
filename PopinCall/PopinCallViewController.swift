//
//  PopinCallViewController.swift
//  PopinCall
//
//  Created by Ashwin Nath on 15/11/22.
//

import UIKit
import LiveKitClient
import AVKit
import LiveKitWebRTC
import AVFAudio

protocol PopinCallView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func closeView()
    func showMessage(title: String, message: String)
    func connectToRoom(liveKitAccessToken: String, liveKitRoom: String, websocketUrl: String)
}

public class PopinCallViewController: UIViewController {
    
    private let popinCallPresenter = PopinCallPresenter(popinInteractor: PopinCallInteractor())
    
    // UI Components
    private var localMediaView: UIView!
    private var labelConnecting: UILabel!
    private var remoteView: UIView?
    
    // LiveKit specific properties
    private var localVideoRenderer: SampleRenderingView?
    private var remoteVideoRenderer: SampleRenderingView?
    private var room: Room?
   
    private var remoteParticipant: RemoteParticipant?
    
    // Control buttons
    private var buttonMuteAudio: UIButton!
    private var buttonMuteVideo: UIButton!
    private var buttonSwapCamera: UIButton!
    private var buttonCallEnd: UIButton!
    
    // State variables
    private var isAudioEnabled = true
    private var isVideoEnabled = true
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .black
        
        // Setup remote video view (full screen)
        setupRemoteVideoView()
        
        // Setup local video view (picture-in-picture)
        setupLocalVideoView()
        
        // Setup connecting label
        setupConnectingLabel()
        
        // Setup control buttons
        setupControlButtons()
        
        // Setup constraints
        setupConstraints()
    }
    
    private func setupRemoteVideoView() {
        remoteVideoRenderer = SampleRenderingView()
        remoteVideoRenderer?.sampleBufferDisplayLayer.videoGravity = .resizeAspectFill
        remoteVideoRenderer?.backgroundColor = .black
        
        if let renderer = remoteVideoRenderer {
            view.addSubview(renderer)
            renderer.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLocalVideoView() {
        localMediaView = UIView()
        localMediaView.backgroundColor = .black
        localMediaView.layer.cornerRadius = 8
        localMediaView.clipsToBounds = true
        localMediaView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(localMediaView)
    }
    
    private func setupConnectingLabel() {
        labelConnecting = UILabel()
        labelConnecting.text = "Connecting..."
        labelConnecting.textColor = .white
        labelConnecting.textAlignment = .center
        labelConnecting.font = UIFont.systemFont(ofSize: 17)
        labelConnecting.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelConnecting)
    }
    
    private func setupControlButtons() {
        // End call button (red)
        buttonCallEnd = UIButton()
        buttonCallEnd.backgroundColor = .systemRed
        buttonCallEnd.layer.cornerRadius = 30
        buttonCallEnd.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        buttonCallEnd.tintColor = .white
        buttonCallEnd.translatesAutoresizingMaskIntoConstraints = false
        buttonCallEnd.addTarget(self, action: #selector(buttonCallEndTapped), for: .touchUpInside)
        view.addSubview(buttonCallEnd)
        
        // Mute audio button
        buttonMuteAudio = UIButton()
        buttonMuteAudio.backgroundColor = .white
        buttonMuteAudio.layer.cornerRadius = 25
        buttonMuteAudio.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        buttonMuteAudio.tintColor = .black
        buttonMuteAudio.translatesAutoresizingMaskIntoConstraints = false
        buttonMuteAudio.addTarget(self, action: #selector(buttonMuteAudioTapped), for: .touchUpInside)
        view.addSubview(buttonMuteAudio)
        
        // Mute video button
        buttonMuteVideo = UIButton()
        buttonMuteVideo.backgroundColor = .white
        buttonMuteVideo.layer.cornerRadius = 25
        buttonMuteVideo.setImage(UIImage(systemName: "video.fill"), for: .normal)
        buttonMuteVideo.tintColor = .black
        buttonMuteVideo.translatesAutoresizingMaskIntoConstraints = false
        buttonMuteVideo.addTarget(self, action: #selector(buttonMuteVideoTapped), for: .touchUpInside)
        view.addSubview(buttonMuteVideo)
        
        // Switch camera button
        buttonSwapCamera = UIButton()
        buttonSwapCamera.backgroundColor = .white
        buttonSwapCamera.layer.cornerRadius = 25
        buttonSwapCamera.setImage(UIImage(systemName: "camera.rotate.fill"), for: .normal)
        buttonSwapCamera.tintColor = .black
        buttonSwapCamera.translatesAutoresizingMaskIntoConstraints = false
        buttonSwapCamera.addTarget(self, action: #selector(buttonSwapCameraTapped), for: .touchUpInside)
        view.addSubview(buttonSwapCamera)
    }
    
    private func setupConstraints() {
        guard let remoteRenderer = remoteVideoRenderer else { return }
        
        NSLayoutConstraint.activate([
            // Remote video view (full screen)
            remoteRenderer.topAnchor.constraint(equalTo: view.topAnchor),
            remoteRenderer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            remoteRenderer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            remoteRenderer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Local video view (top-right corner)
            localMediaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            localMediaView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            localMediaView.widthAnchor.constraint(equalToConstant: 120),
            localMediaView.heightAnchor.constraint(equalToConstant: 160),
            
            // Connecting label (center)
            labelConnecting.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelConnecting.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // End call button (center bottom)
            buttonCallEnd.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonCallEnd.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCallEnd.widthAnchor.constraint(equalToConstant: 60),
            buttonCallEnd.heightAnchor.constraint(equalToConstant: 60),
            
            // Control buttons (left side, vertical stack)
            buttonMuteAudio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonMuteAudio.bottomAnchor.constraint(equalTo: buttonCallEnd.topAnchor, constant: -20),
            buttonMuteAudio.widthAnchor.constraint(equalToConstant: 50),
            buttonMuteAudio.heightAnchor.constraint(equalToConstant: 50),
            
            buttonMuteVideo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonMuteVideo.bottomAnchor.constraint(equalTo: buttonMuteAudio.topAnchor, constant: -15),
            buttonMuteVideo.widthAnchor.constraint(equalToConstant: 50),
            buttonMuteVideo.heightAnchor.constraint(equalToConstant: 50),
            
            buttonSwapCamera.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonSwapCamera.bottomAnchor.constraint(equalTo: buttonMuteVideo.topAnchor, constant: -15),
            buttonSwapCamera.widthAnchor.constraint(equalToConstant: 50),
            buttonSwapCamera.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Button Actions
    @objc private func buttonCallEndTapped() {
        Task {
            await room?.disconnect()
        }
        closeView()
    }
    
    @objc private func buttonSwapCameraTapped() {
        flipCamera()
    }
    
    @objc private func buttonMuteVideoTapped() {
        Task {
                    isVideoEnabled = !isVideoEnabled
                
                try await room?.localParticipant.setCamera(enabled: isVideoEnabled)
                
                
                DispatchQueue.main.async {
                    if self.isVideoEnabled {
                        self.buttonMuteVideo.setImage(UIImage(systemName: "video.fill"), for: .normal)
                        self.buttonMuteVideo.backgroundColor = .white
                        self.buttonMuteVideo.tintColor = .black
                    } else {
                        self.buttonMuteVideo.setImage(UIImage(systemName: "video.slash.fill"), for: .normal)
                        self.buttonMuteVideo.backgroundColor = .systemRed
                        self.buttonMuteVideo.tintColor = .white
                    }
                }
            
        }
    }
    
    @objc private func buttonMuteAudioTapped() {
        Task {
            
                isAudioEnabled = !isAudioEnabled
                try await room?.localParticipant.setMicrophone(enabled: isAudioEnabled)
                
                DispatchQueue.main.async {
                    if self.isAudioEnabled {
                        self.buttonMuteAudio.setImage(UIImage(systemName: "mic.fill"), for: .normal)
                        self.buttonMuteAudio.backgroundColor = .white
                        self.buttonMuteAudio.tintColor = .black
                    } else {
                        self.buttonMuteAudio.setImage(UIImage(systemName: "mic.slash.fill"), for: .normal)
                        self.buttonMuteAudio.backgroundColor = .systemRed
                        self.buttonMuteAudio.tintColor = .white
                    }
                }
            
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup dynamic UI
        setupUI()
        
        popinCallPresenter.attachView(popinCallView: self)
        self.navigationItem.setHidesBackButton(true, animated: false)
        popinCallPresenter.createCall()
        
       
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Disable idle timer to prevent screen from locking
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Re-enable idle timer to allow screen to lock again
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    public init() {
        super.init(nibName: nil, bundle: Bundle(for: PopinCallViewController.self))
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    @objc func flipCamera() {
        Task {
            let videoTrack = room?.localParticipant.firstCameraVideoTrack as? LocalVideoTrack
                        let cameraCapturer = videoTrack?.capturer as? CameraCapturer
                        try await  cameraCapturer?.switchCameraPosition()
        }
    }
    
    
}
extension PopinCallViewController: PopinCallView {
    func startLoading() {
        
    }
    
    func finishLoading() {
        
    }
    
    func closeView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showMessage(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func connectToRoom(liveKitAccessToken: String, liveKitRoom: String, websocketUrl: String) {
        print("Connect start")
        
        Task {
            do {
                // Initialize room with options
                let roomOptions = RoomOptions(
                    defaultCameraCaptureOptions: CameraCaptureOptions(
                        dimensions: .h720_169
                    ),
                    defaultScreenShareCaptureOptions: ScreenShareCaptureOptions(
                        dimensions: .h720_169,
                        useBroadcastExtension: true
                    ),
                    defaultAudioCaptureOptions: AudioCaptureOptions(
                        echoCancellation: true,
                        autoGainControl: true,
                        noiseSuppression: true,
                        highpassFilter: true,
                        typingNoiseDetection: true
                    )
                )
                
                self.room = Room(delegate: self)
                
                // Connect to room
                try await self.room?.connect(url: websocketUrl, token: liveKitAccessToken, roomOptions: roomOptions)
                
                // Publish local tracks
                try await self.room?.localParticipant.setMicrophone(enabled: true)
                try await self.room?.localParticipant.setCamera(enabled: true)
                
                // Get track references after publishing
                
                DispatchQueue.main.async {
                    self.showRoomUI(inRoom: true)
                    self.labelConnecting.isHidden = true
                }
                
            } catch {
                print("Failed to connect: \(error)")
                DispatchQueue.main.async {
                    self.showMessage(title: "Error", message: "Failed to connect to room: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func showRoomUI(inRoom: Bool) {
        //                self.connectButton.isHidden = inRoom
        //                self.roomTextField.isHidden = inRoom
        //                self.roomLine.isHidden = inRoom
        //                self.roomLabel.isHidden = inRoom
        //                self.micButton.isHidden = !inRoom
        //                self.disconnectButton.isHidden = !inRoom
        //                self.navigationController?.setNavigationBarHidden(inRoom, animated: true)
        UIApplication.shared.isIdleTimerDisabled = inRoom
        
        // Show / hide the automatic home indicator on modern iPhones.
        self.setNeedsUpdateOfHomeIndicatorAutoHidden()
    }
    
    
    
    func renderRemoteParticipant(participant: RemoteParticipant) -> Bool {
        // Look for video tracks
        self.remoteVideoRenderer.track = participant.firstCameraPublication?.track
        return false
    }
    
    func renderRemoteParticipants(participants: [RemoteParticipant]) {
        for participant in participants {
            // Find the first renderable track.
            if !participant.videoTrackPublications.isEmpty,
               renderRemoteParticipant(participant: participant) {
                break
            }
        }
    }
    
    func cleanupRemoteParticipant() {
        //        if self.remoteParticipant != nil {
        //            self.remoteView?.removeFromSuperview()
        //            self.remoteView = nil
        //            self.remoteParticipant = nil
        //        }
    }
    func addRemoteVideoTrack(track: VideoTrack) {
        DispatchQueue.main.async {
            if let renderer = self.remoteVideoRenderer {
                track.add(videoRenderer: renderer)
                self.labelConnecting.isHidden = true
            }
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension PopinCallViewController: RoomDelegate {
    func logMessage(messageText: String) {
        print(messageText)
    }
    
    func room(_ room: Room, didConnectWithError error: Error?) {
        if let error = error {
            logMessage(messageText: "Failed to connect to room: \(error)")
            return
        }
        
        logMessage(messageText: "Connected to room \(room.name ?? "unknown") as \(room.localParticipant.identity ?? "")")
        
        // Render existing remote participants
        renderRemoteParticipants(participants: Array(room.remoteParticipants.values))
    }
    
    func room(_ room: Room, didDisconnectWithError error: Error?) {
        logMessage(messageText: "Disconnected from room, error = \(String(describing: error))")
        
        self.cleanupRemoteParticipant()
        self.room = nil
        
        DispatchQueue.main.async {
            self.showRoomUI(inRoom: false)
        }
    }
    
    func room(_ room: Room, participantDidConnect participant: RemoteParticipant) {
        logMessage(messageText: "Participant \(participant.identity ?? "unknown") connected")
        
        // Try to render the new participant
        _ = renderRemoteParticipant(participant: participant)
    }
    
    func room(_ room: Room, participantDidDisconnect participant: RemoteParticipant) {
        logMessage(messageText: "Participant \(participant.identity ?? "unknown") disconnected")
        
        if self.remoteParticipant?.identity == participant.identity {
            cleanupRemoteParticipant()
            
            // Find another participant to render
            let remainingParticipants = Array(room.remoteParticipants.values.filter { $0.identity != participant.identity })
            renderRemoteParticipants(participants: remainingParticipants)
        }
    }
    
    func room(_ room: Room, participant: LocalParticipant, didPublishTrack publication: LocalTrackPublication) {
        logMessage(messageText: "Local participant published track: \(publication.name ?? "unknown")")
        
        if publication.kind == .video, let track = publication.track as? LocalVideoTrack {
            self.localVideoTrack = track
            if let renderer = localVideoRenderer {
                track.add(videoRenderer: renderer)
            }
        } else if publication.kind == .audio, let track = publication.track as? LocalAudioTrack {
            self.localAudioTrack = track
        }
    }
    
    func room(_ room: Room, participant: RemoteParticipant, didPublishTrack publication: RemoteTrackPublication) {
        logMessage(messageText: "Participant \(participant.identity ?? "unknown") published track: \(publication.name ?? "unknown")")
        
        if publication.kind == .video, let track = publication.track as? VideoTrack {
            addRemoteVideoTrack(track: track)
            self.remoteParticipant = participant
        }
    }
    
    func room(_ room: Room, participant: RemoteParticipant, didUnpublishTrack publication: RemoteTrackPublication) {
        logMessage(messageText: "Participant \(participant.identity ?? "unknown") unpublished track: \(publication.name ?? "unknown")")
        
        if publication.kind == .video && self.remoteParticipant?.identity == participant.identity {
            closeView()
        }
    }
}

// MARK:- SampleRenderingView for LiveKit video rendering
final class SampleRenderingView: UIView, VideoRenderer {
    override class var layerClass: AnyClass {
        AVSampleBufferDisplayLayer.self
    }
    
    var sampleBufferDisplayLayer: AVSampleBufferDisplayLayer {
        layer as! AVSampleBufferDisplayLayer
    }
    
    var isAdaptiveStreamEnabled: Bool { true }
    var adaptiveStreamSize: CGSize { bounds.size }
    
    func render(frame: VideoFrame) {
        if let sampleBuffer = frame.toCMSampleBuffer() {
            Task { @MainActor in
                sampleBufferDisplayLayer.sampleBufferRenderer.enqueue(sampleBuffer)
                sampleBufferDisplayLayer.setAffineTransform(CGAffineTransform(rotationAngle: frame.rotation.rotationAngle))
            }
        }
    }
}

// MARK:- VideoRotation extension
extension VideoRotation {
    var rotationAngle: CGFloat {
        switch self {
        case ._0: return 0
        case ._90: return .pi / 2
        case ._180: return .pi
        case ._270: return 3 * .pi / 2
        @unknown default: return 0
        }
    }
}
