//
//  LocalCameraPreview.swift
//  PopinCall
//

import SwiftUI
import AVFoundation

#if canImport(UIKit)
import UIKit

// MARK: - Local Camera Preview

struct LocalCameraPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> LocalCameraPreviewUIView {
        let view = LocalCameraPreviewUIView()
        view.startCapture()
        return view
    }

    func updateUIView(_ uiView: LocalCameraPreviewUIView, context: Context) {}

    static func dismantleUIView(_ uiView: LocalCameraPreviewUIView, coordinator: ()) {
        uiView.stopCapture()
    }
}

class LocalCameraPreviewUIView: UIView {
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .black
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        previewLayer?.frame = bounds
    }

    func startCapture() {
        let session = AVCaptureSession()
        session.sessionPreset = .high

        guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
              let input = try? AVCaptureDeviceInput(device: camera) else {
            return
        }

        if session.canAddInput(input) {
            session.addInput(input)
        }

        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = bounds
        layer.addSublayer(previewLayer)

        self.captureSession = session
        self.previewLayer = previewLayer

        DispatchQueue.global(qos: .userInitiated).async {
            session.startRunning()
        }
    }

    func stopCapture() {
        captureSession?.stopRunning()
        previewLayer?.removeFromSuperlayer()
        captureSession = nil
        previewLayer = nil
    }
}

#endif
