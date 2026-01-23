//
//  PiPSupport.swift
//  Popin
//
//  Created for PiP functionality
//

import AVKit
import LiveKit
import SwiftUI

// MARK: - PiP View Controllers

final class PiPPreviewViewController: UIViewController, VideoRenderer {
    private lazy var renderingView = PiPSampleRenderingView()
    private var frameCount = 0

    override func loadView() {
        renderingView.sampleBufferDisplayLayer.videoGravity = .resizeAspectFill
        view = renderingView
        view.backgroundColor = .clear
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var isAdaptiveStreamEnabled: Bool { true }
    var adaptiveStreamSize: CGSize { view.bounds.size }

    func render(frame: LiveKit.VideoFrame) {
        guard let sampleBuffer = frame.toCMSampleBuffer() else {
            print("PiPPreview: Failed to convert frame to CMSampleBuffer")
            return
        }

        frameCount += 1
//        if frameCount == 1 {
//            print("PiPPreview: First frame received!")
//        }
//        if frameCount % 30 == 0 {
//            print("PiPPreview: Rendered \(frameCount) frames, size: \(frame.dimensions)")
//        }

        Task { @MainActor in
            let layer = renderingView.sampleBufferDisplayLayer
            if layer.status == .failed {
//                print("PiPPreview: Layer failed with error: \(String(describing: layer.error))")
                layer.flush()
            }
            layer.sampleBufferRenderer.enqueue(sampleBuffer)
            layer.setAffineTransform(CGAffineTransform(rotationAngle: frame.rotation.rotationAngle))
        }
    }
}

final class PiPVideoCallViewController: AVPictureInPictureVideoCallViewController, VideoRenderer {
    private lazy var renderingView = PiPSampleRenderingView()
    private var frameCount = 0

    override func loadView() {
        renderingView.sampleBufferDisplayLayer.videoGravity = .resizeAspectFill
        view = renderingView
        view.backgroundColor = .clear
//        print("PiPVideoCall: loadView called")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("PiPVideoCall: viewDidLoad - view bounds: \(view.bounds)")
    }

    var isAdaptiveStreamEnabled: Bool { true }
    var adaptiveStreamSize: CGSize { view.bounds.size }

    func render(frame: LiveKit.VideoFrame) {
        guard let sampleBuffer = frame.toCMSampleBuffer() else {
//            print("PiPVideoCall: Failed to convert frame to CMSampleBuffer")
            return
        }

        frameCount += 1
//        if frameCount == 1 {
//            print("PiPVideoCall: First frame received!")
//        }
//        if frameCount % 30 == 0 {
//            print("PiPVideoCall: Rendered \(frameCount) frames, size: \(frame.dimensions), preferredSize will be: \(frame.rotatedSize)")
//        }

        Task { @MainActor in
            let layer = renderingView.sampleBufferDisplayLayer
            if layer.status == .failed {
//                print("PiPVideoCall: Layer failed with error: \(String(describing: layer.error))")
                layer.flush()
            }
            layer.sampleBufferRenderer.enqueue(sampleBuffer)
            layer.setAffineTransform(CGAffineTransform(rotationAngle: frame.rotation.rotationAngle))
            preferredContentSize = frame.rotatedSize
        }
    }
}

final class PiPSampleRenderingView: UIView {
    override class var layerClass: AnyClass {
        AVSampleBufferDisplayLayer.self
    }

    var sampleBufferDisplayLayer: AVSampleBufferDisplayLayer {
        layer as! AVSampleBufferDisplayLayer
    }

    override func layoutSubviews() {
        super.layoutSubviews()
//        print("PiPSampleRenderingView: layoutSubviews - bounds: \(bounds)")
    }
}

// MARK: - LiveKit Extensions

extension LiveKit.VideoRotation {
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

extension LiveKit.VideoFrame {
    var rotatedSize: CGSize {
        switch rotation {
        case ._90, ._270: CGSize(width: Int(dimensions.height), height: Int(dimensions.width))
        default: CGSize(width: Int(dimensions.width), height: Int(dimensions.height))
        }
    }
}

// MARK: - PiP View Wrapper

class PiPHandler: ObservableObject {
    weak var controller: AVPictureInPictureController?
    
    func startPictureInPicture() {
        print("PiPHandler: Requesting start")
        controller?.startPictureInPicture()
    }
    
    func stopPictureInPicture() {
        controller?.stopPictureInPicture()
    }
}

struct PiPView: UIViewControllerRepresentable {
    let track: VideoTrack
    let pipHandler: PiPHandler

    func makeUIViewController(context: Context) -> UIViewController {
        // Make sure view controllers are loaded before adding renderers
        let _ = context.coordinator.previewController.view
        let _ = context.coordinator.videoCallController.view

//        print("PiPView: Adding video renderers to track")
        track.add(videoRenderer: context.coordinator.previewController)
        track.add(videoRenderer: context.coordinator.videoCallController)

        return context.coordinator.previewController
    }

    func updateUIViewController(_: UIViewController, context: Context) {
        // context.coordinator.toggle(enabled: pip)
        // ensure controller is set?
        if pipHandler.controller == nil {
            pipHandler.controller = context.coordinator.controller
        }
        
        context.coordinator.updateTrack(track)
    }

    static func dismantleUIViewController(_ uiViewController: UIViewController, coordinator: Coordinator) {
//        print("PiPView: Removing video renderers from track")
        coordinator.cleanup()
    }

    func makeCoordinator() -> Coordinator {
        let previewController = PiPPreviewViewController()
        let videoCallController = PiPVideoCallViewController()

        let contentSource = AVPictureInPictureController.ContentSource(
            activeVideoCallSourceView: previewController.view,
            contentViewController: videoCallController
        )
        let controller = AVPictureInPictureController(contentSource: contentSource)
        controller.canStartPictureInPictureAutomaticallyFromInline = true
        controller.setValue(1, forKey: "controlsStyle") // Display close/fullscreen buttons

        let coordinator = Coordinator(
            controller: controller,
            previewController: previewController,
            videoCallController: videoCallController,
            track: track
        )
        controller.delegate = coordinator
        
        // Assign controller to handler
        pipHandler.controller = controller
        
        return coordinator
    }

    final class Coordinator: NSObject, AVPictureInPictureControllerDelegate {
        let controller: AVPictureInPictureController
        let previewController: PiPPreviewViewController
        let videoCallController: PiPVideoCallViewController
        private var track: VideoTrack

        init(controller: AVPictureInPictureController,
             previewController: PiPPreviewViewController,
             videoCallController: PiPVideoCallViewController,
             track: VideoTrack) {
            self.controller = controller
            self.previewController = previewController
            self.videoCallController = videoCallController
            self.track = track
            super.init()
        }
        
        func updateTrack(_ newTrack: VideoTrack) {
            guard newTrack.sid != track.sid else { return }
            
            // Remove renderers from old track
            track.remove(videoRenderer: previewController)
            track.remove(videoRenderer: videoCallController)
            
            // Update track
            track = newTrack
            
            // Add renderers to new track
            track.add(videoRenderer: previewController)
            track.add(videoRenderer: videoCallController)
        }

        func cleanup() {
            if controller.isPictureInPictureActive {
                controller.stopPictureInPicture()
            }
            track.remove(videoRenderer: previewController)
            track.remove(videoRenderer: videoCallController)
        }

        // MARK: - AVPictureInPictureControllerDelegate

        func pictureInPictureControllerWillStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
            print("PiP will start")
        }

        func pictureInPictureControllerDidStartPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
            print("PiP did start")
            PopinCallManager.shared.enterPiPMode()
        }

        func pictureInPictureControllerWillStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
            print("PiP will stop")
        }

        func pictureInPictureControllerDidStopPictureInPicture(_ pictureInPictureController: AVPictureInPictureController) {
            print("PiP did stop")
            PopinCallManager.shared.exitPiPMode()
        }

        func pictureInPictureController(_ pictureInPictureController: AVPictureInPictureController,
                                       failedToStartPictureInPictureWithError error: Error) {
            print("PiP failed to start: \(error.localizedDescription)")
        }
    }
}
