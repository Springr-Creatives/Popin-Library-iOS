//
//  VideoCallController.swift
//  Popin
//
//  Created by Ashwin Nath on 15/03/24.
//

import Foundation
import LiveKit
import AVFAudio
import UIKit
import Combine
import LiveKitWebRTC


protocol VideoCallView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func loadCall(call : VideoCall)
    func showMessage(message: String)
}

public class VideoCallViewController: UIViewController {
    
    var callId : Int = 0;
    var callComponentId : Int = 0;
    var callUUID : UUID? = nil;
    var callRole : Int = 0;
    var customerName : String = "";
    var artifact : String = "";
    var closedCall : Bool = false;
    
    
    // CallKit components
    
    var darwinNotificationCenterObservation: DarwinNotificationObservation?
    
    
    private var timer: Timer?
    
    
    private let videoCallPresenter = VideoCallPresenter(videoCallInteractor: VideoCallInteractor())
    var videoCall : VideoCall? = nil
    
    lazy var room = Room(delegate: self)
    
    var isAudioEnabled = true, isVideoEnabled = true, isScreenSharing = false
    
    var currentRemoteVideo = "";
    
    var localVideoTrack: VideoTrack?;
    
    private var remoteParticipants = [RemoteParticipant]()
    
    private var cellReference = NSHashTable<ParticipantCell>.weakObjects()
    
    
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var callerNameLabel: UILabel!
    
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let r = UICollectionView(frame: .zero, collectionViewLayout: layout)
        r.register(ParticipantCell.self, forCellWithReuseIdentifier: ParticipantCell.reuseIdentifier)
        r.delegate = self
        r.dataSource = self
        r.clipsToBounds = true
        r.translatesAutoresizingMaskIntoConstraints = false // Important!
        r.backgroundColor = UIColor.clear.withAlphaComponent(0)
        // r.contentInsetAdjustmentBehavior = .never
        return r
    }()
    
    
    
    lazy var remoteVideoView = {
        let r = VideoView()
        r.layoutMode = .fill
        r.backgroundColor = .black
        r.clipsToBounds = true
        // r.isDebugMode = true
        r.tag = 1723
        r.translatesAutoresizingMaskIntoConstraints = false
        return r
    }()
    
    lazy var buttonCallEnd: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.layer.cornerRadius = 40
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        button.setPreferredSymbolConfiguration(largeConfig, forImageIn: .normal)
        button.setImage(UIImage(systemName: "phone.down.fill"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.text = artifact
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6) // Semi-transparent background
        label.layer.cornerRadius = 8 // Rounded corners for a better look
        label.clipsToBounds = true // Ensure the corners are clipped
        label.textAlignment = .center // Center text alignment for better visibility
        label.shadowColor = UIColor.black.withAlphaComponent(0.8) // Add shadow for extra visibility
        label.shadowOffset = CGSize(width: 1, height: 1) // Subtle shadow offset
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium) // Customize font size and weight as needed
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // Allow unlimited lines
        return label
    }()
    
    lazy var buttonSwapCamera: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "camera.rotate.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var buttonShareScreen: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "rectangle.inset.filled.and.person.filled"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var buttonMuteAudio: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var buttonMuteVideo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.setImage(UIImage(systemName: "video.fill"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    func populateCallUI() {
        view.subviews.forEach { subView in
            subView.removeFromSuperview()
        }
        view.backgroundColor = .black
        view.addSubview(remoteVideoView)
        view.addSubview(buttonCallEnd)
        view.addSubview(buttonMuteAudio)
        view.addSubview(buttonMuteVideo)
        view.addSubview(buttonSwapCamera)
        view.addSubview(buttonShareScreen)
        view.addSubview(collectionView)
        view.addSubview(productNameLabel)
        setupViewConstraints()
        buttonCallEnd.addTarget(self, action: #selector(buttonCallEndTapped), for: .touchUpInside)
        buttonMuteAudio.addTarget(self, action: #selector(buttonMuteAudioTapped), for: .touchUpInside)
        buttonMuteVideo.addTarget(self, action: #selector(buttonMuteVideoTapped), for: .touchUpInside)
        buttonSwapCamera.addTarget(self, action: #selector(buttonSwapCameraTapped), for: .touchUpInside)
        buttonShareScreen.addTarget(self, action: #selector(buttonShareScreenTapped), for: .touchUpInside)
        buttonMuteAudio.isEnabled = false
        buttonMuteVideo.isEnabled = false
    }
    
    
    func setupViewConstraints() {
        
        
        
        // Set up constraints for subview1
        NSLayoutConstraint.activate([
            remoteVideoView.topAnchor.constraint(equalTo: view.topAnchor),
            remoteVideoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            remoteVideoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            remoteVideoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Set up constraints for subview2
        
        
        NSLayoutConstraint.activate([
            productNameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4), // Align label to bottom
            productNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center label horizontally
            
            buttonCallEnd.bottomAnchor.constraint(equalTo: productNameLabel.topAnchor, constant: -16), // Place button above the label
            buttonCallEnd.centerXAnchor.constraint(equalTo: productNameLabel.centerXAnchor), // Align button horizontally with the label
            buttonCallEnd.widthAnchor.constraint(equalToConstant: 80),
            buttonCallEnd.heightAnchor.constraint(equalTo: buttonCallEnd.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonMuteAudio.widthAnchor.constraint(equalToConstant: 40),
            buttonMuteAudio.heightAnchor.constraint(equalTo: buttonMuteAudio.widthAnchor),
            buttonMuteAudio.bottomAnchor.constraint(equalTo: buttonCallEnd.topAnchor, constant: -16),
            buttonMuteAudio.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            buttonMuteVideo.widthAnchor.constraint(equalToConstant: 40),
            buttonMuteVideo.heightAnchor.constraint(equalTo: buttonMuteVideo.widthAnchor),
            buttonMuteVideo.bottomAnchor.constraint(equalTo: buttonMuteAudio.topAnchor, constant: -12),
            buttonMuteVideo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            buttonSwapCamera.widthAnchor.constraint(equalToConstant: 40),
            buttonSwapCamera.heightAnchor.constraint(equalTo: buttonSwapCamera.widthAnchor),
            buttonSwapCamera.bottomAnchor.constraint(equalTo: buttonMuteVideo.topAnchor, constant: -12),
            buttonSwapCamera.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            buttonShareScreen.widthAnchor.constraint(equalToConstant: 40),
            buttonShareScreen.heightAnchor.constraint(equalTo: buttonShareScreen.widthAnchor),
            buttonShareScreen.bottomAnchor.constraint(equalTo: buttonSwapCamera.topAnchor, constant: -12),
            buttonShareScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 120),
            collectionView.leadingAnchor.constraint(equalTo: buttonMuteAudio.trailingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: buttonCallEnd.topAnchor, constant: -20)
        ])
        
        
        
        
    }
    
    
    
    
    @MainActor
    private func setParticipants() async {
        remoteParticipants = Array(room.remoteParticipants.values)
        collectionView.reloadData()
    }
    
    public init() {
        //   let frameworkBundleID  = "to.popin.PopinCall";
        //   let bundle = Bundle(identifier: frameworkBundleID)
        super.init(nibName: "VideoCallViewController", bundle: Bundle(for: VideoCallViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    deinit {
        callKitProvider.invalidate()
        timer?.invalidate()
        timer = nil
        // We are done with cameras
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        videoCallPresenter.attachView(videoCallView: self)
        callerNameLabel.text = customerName
        productLabel.text = artifact
        setupNotifications()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] _ in
            self?.reComputeVideoViewEnabled()
        })
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
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.frame = view.bounds
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    
    @objc func buttonShareScreenTapped() {
        print("screen_sharing")
        isScreenSharing = !isScreenSharing
        buttonShareScreen.backgroundColor = isScreenSharing ? .red : .white
        Task {
            do {
                try await  room.localParticipant.setScreenShare(enabled: isScreenSharing)
            } catch {
                print(error)
            }
        }
    }
    
    @objc func buttonSwapCameraTapped() {
        print("swap_camera")
        Task {
            let videoTrack = room.localParticipant.firstCameraVideoTrack as? LocalVideoTrack
            let cameraCapturer = videoTrack?.capturer as? CameraCapturer
            try await  cameraCapturer?.switchCameraPosition()
        }
    }
    
    @objc func buttonMuteVideoTapped() {
        print("mute_video")
        isVideoEnabled = !isVideoEnabled
        if (isVideoEnabled) {
            buttonMuteVideo.setImage(UIImage(systemName: "video.fill"), for: .normal)
        } else {
            buttonMuteVideo.setImage(UIImage(systemName: "video.slash.fill"), for: .normal)
        }
        Task {
            do {
                
                try await room.localParticipant.setCamera(enabled: isVideoEnabled)
            } catch {
                print(error)
            }
        }
        
    }
    
    
    @objc func buttonMuteAudioTapped() {
        isAudioEnabled = !isAudioEnabled
        if (isAudioEnabled) {
            buttonMuteAudio.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        } else {
            buttonMuteAudio.setImage(UIImage(systemName: "mic.slash.fill"), for: .normal)
        }
        Task {
            do {
                try await room.localParticipant.setMicrophone(enabled: isAudioEnabled)
            } catch {
                print(error)
            }
        }
        
    }
    func closeViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func buttonCallEndTapped() {
        closeViewController()
    }
    
    func setupNotifications() {
        // We need to store the value in variable/state to keep notification active.
        darwinNotificationCenterObservation = DarwinNotificationCenter.shared.addObserver(name: "iOS_BroadcastStopped", callback: notificationCallback)
    }
    
    func performAsyncTask() async {
        do {
            try await room.localParticipant.setScreenShare(enabled: false)
            DispatchQueue.main.async {
                self.isScreenSharing = false
                self.buttonShareScreen.backgroundColor = self.isScreenSharing ? .red : .white
            }
        } catch {
            print("An error occurred while updating screen share")
        }
    }
    
    // function that matches the C function pointer type
    func notificationCallback() {
        // Dispatch to handle async code
        DispatchQueue.global().async {
            Task {
                await self.performAsyncTask()
            }
        }
    }
}



extension VideoCallViewController: RoomDelegate {
    
    public func room(_: Room, participant _: LocalParticipant, didPublishTrack publication: LocalTrackPublication) {
        print("did publish>\(publication.track?.name ?? "")")
        guard let track = publication.track as? VideoTrack else { return }
        if (publication.source == .screenShareVideo) {
            return;
        }
        localVideoTrack = track
        remoteVideoView.track = localVideoTrack
    }
    public func room(_ room: Room, participant: RemoteParticipant, didUnpublishTrack publication: RemoteTrackPublication) {
        print("unpublish>\(participant.identity)")
    }
    
    public func room(_ room: Room, participant: Participant, trackPublication: TrackPublication, didUpdateIsMuted isMuted: Bool) {
        print("ismuted>\(participant.identity)>\(isMuted)")
        if (currentRemoteVideo == participant.identity?.stringValue && isMuted) {
            if (trackPublication.track?.kind == .video) {
                if let track = room.localParticipant.videoTracks.first?.track as? VideoTrack {
                    print("SHOW_LOCAL_IN_MAIN")
                    self.renderRemoteView(track: track, identity: room.localParticipant.identity?.stringValue)
                }
            }
        }
    }
    
    public func room(_: Room, didUpdateConnectionState connectionState: ConnectionState, from _: ConnectionState) {
        print("connection state did update")
        
        Task { @MainActor in
            
            if case .disconnected = connectionState {
                remoteParticipants = []
                collectionView.reloadData()
                closeViewController();
            }
            
        }
    }
    
    
    public func room(_ room: Room, participantDidConnect participant: RemoteParticipant) {
        Task { @MainActor in
            await setParticipants()
        }
    }
    
    
    
    public func room(_ room: Room, participantDidDisconnect participant: RemoteParticipant) {
        Task { @MainActor in
            await setParticipants()
        }
    }
    
    public func room(_ room: Room, didDisconnectWithError error: LiveKitError?) {
        print("Disconnected with error")
        closeViewController();
    }
    
    
}

extension VideoCallViewController: VideoCallView {
    
    
    func loadCall(call: VideoCall) {
        self.videoCall = call
        print("start_call")
        Task {
            do {
                let roomOptions = RoomOptions(
                    
                    defaultCameraCaptureOptions: CameraCaptureOptions(
                        dimensions: .h720_169
                    ),
                    defaultScreenShareCaptureOptions: ScreenShareCaptureOptions(
                        dimensions: .h720_169,
                        useBroadcastExtension: true
                    )
                    //suspendLocalVideoTracksInBackground : false
                )
                print("start_call1")
                try await room.connect(url: call.websocket, token: call.access_token,roomOptions: roomOptions)
                print("start_call_connected")
                // Connection successful...
                // Publishing camera & mic...
                try await room.localParticipant.setMicrophone(enabled: true)
                print("mic_published")
                try await room.localParticipant.setCamera(enabled: true)
                print("camera_published")
                buttonMuteAudio.isEnabled = true
                buttonMuteVideo.isEnabled = true
                
                await setParticipants()
                
            } catch let error {
                print(error)
            }
        }
        //        todo check if token got sucesfully in above from meralda dev
        //                        if so start livekit
    }
    
    func startLoading() {
        // self.startIndicatingActivity()
    }
    
    func finishLoading() {
        //self.stopIndicatingActivity()
    }
    
    func showMessage(message: String) {
        
    }
    
}

extension VideoCallViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        
        let itemWidth = collectionView.bounds.width / 3 // Show 3 items at a time
        let itemHeight = collectionView.bounds.height
        return CGSize(width: 60, height: 80)
    }
    
    public func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, insetForSectionAt _: Int) -> UIEdgeInsets {
        .zero
    }
    
    public func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumLineSpacingForSectionAt _: Int) -> CGFloat {
        0
    }
    
    public func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, minimumInteritemSpacingForSectionAt _: Int) -> CGFloat {
        0
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            if let track = room.localParticipant.videoTracks.first?.track as? VideoTrack {
                print("CLICK_SHOW LOCAL IN MAIN")
                self.renderRemoteView(track: track, identity: room.localParticipant.identity?.stringValue)
            }
        } else {
            let actualIndex = indexPath.row - 1;
            let participant = remoteParticipants[actualIndex]
            if let track = participant.videoTracks.first?.track as? VideoTrack {
                print("CLICK_SHOW PARTIC IN MAIN>\(participant.identity)")
                self.renderRemoteView(track: track, identity: participant.identity?.stringValue)
            }
        }
        
        
        //  collectionView.reloadItems(at: collectionView.indexPathsForVisibleItems)
    }
    
    public func renderRemoteView(track: VideoTrack, identity: String?) {
        if (track.isMuted) {
            return;
        }
        currentRemoteVideo = identity ?? ""
        DispatchQueue.main.async {
            if let removable: VideoView = self.view.viewWithTag(1723) as? VideoView {
                print("remove_existing")
                removable.isEnabled = false
                removable.removeFromSuperview()
                
            }
            //            self.remoteVideoView.isEnabled = false
            //            self.remoteVideoView.track?.remove(videoRenderer: self.remoteVideoView)
            //            self.remoteVideoView.track = track
            //            self.remoteVideoView.isEnabled = true
            print("create_new")
            self.remoteVideoView = {
                let r = VideoView()
                r.layoutMode = .fill
                r.backgroundColor = .black
                r.clipsToBounds = true
                r.tag = 1723
                r.translatesAutoresizingMaskIntoConstraints = false
                return r
            }()
            self.view.addSubview(self.remoteVideoView)
            self.remoteVideoView.track = track
            print("set_constraints")
            
            NSLayoutConstraint.activate([
                self.remoteVideoView.topAnchor.constraint(equalTo: self.view.topAnchor),
                self.remoteVideoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                self.remoteVideoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                self.remoteVideoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor )
            ])
            self.view.sendSubviewToBack(self.remoteVideoView)
        }
    }
    
    public func reComputeVideoViewEnabled() {
        let visibleCells = collectionView.visibleCells.compactMap { $0 as? ParticipantCell }
        let offScreenCells = cellReference.allObjects.filter { !visibleCells.contains($0) }
        
        for cell in visibleCells.filter({ !$0.videoView.isEnabled }) {
            
            cell.videoView.isEnabled = true
        }
        
        for cell in offScreenCells.filter(\.videoView.isEnabled) {
            
            cell.videoView.isEnabled = false
        }
    }
}

extension VideoCallViewController: UICollectionViewDataSource {
    
    
    
    public func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        print("TOTAL_SIZE_INCOLLECTIONVIEW>\(remoteParticipants.count + 1)")
        return remoteParticipants.count + 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParticipantCell.reuseIdentifier,
                                                      for: indexPath)
        
        if let cell = cell as? ParticipantCell {
            // keep weak reference to cell
            cellReference.add(cell)
            if (indexPath.row == 0) {
                cell.participant = room.localParticipant
                cell.noVideoImage.isHidden = true
            } else {
                let actualIndex = indexPath.row - 1
                if actualIndex < remoteParticipants.count {
                    let participant = remoteParticipants[actualIndex]
                    cell.participant = participant
                }
            }
        }
        
        return cell
    }
}
