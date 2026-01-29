//
//  VideoCallPresenter.swift
//  Popin
//
//  Created by Ashwin Nath on 16/03/24.
//

import Foundation

#if canImport(UIKit)
class VideoCallPresenter {
    
    private let videoCallInteractor: VideoCallInteractor
    weak private var videoCallView: VideoCallView?
    
    init(videoCallInteractor: VideoCallInteractor) {
        self.videoCallInteractor = videoCallInteractor
    }
    
    func attachView(videoCallView: VideoCallView) {
        self.videoCallView = videoCallView
    }
    
    func detachView() {
        videoCallView = nil
    }
    
//    func acceptCall(callComponentId: Int, callRole: Int) {
//        print("PRESENTER_ANSWER_CALL")
//        self.videoCallInteractor.notifyAccept(callComponentId: callComponentId, callRole: callRole,  onAccept: { (videoCall) in
//            if (videoCall.status == 1) {
//                self.videoCallView?.loadCall(call: videoCall)
//                self.videoCallView?.finishLoading()
//            } else {
//                self.videoCallView?.closeCall(message: "Sorry. The call request has expired.")
//            }
//        }, onFailure: { (error) in
//            self.videoCallView?.finishLoading()
//            self.videoCallView?.showMessage(message: error)
//        })
//    }
    
    func rejectCall(callComponentId: Int) {
      //  self.videoCallInteractor.notifyReject(callComponentId: callComponentId)
    }

    func endCall(callId: Int, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void) {
        Task {
            do {
                try await videoCallInteractor.endCall(callId: callId)
                await MainActor.run {
                    onSuccess()
                }
            } catch {
                await MainActor.run {
                    onFailure(error.localizedDescription)
                }
            }
        }
    }

}
#endif
