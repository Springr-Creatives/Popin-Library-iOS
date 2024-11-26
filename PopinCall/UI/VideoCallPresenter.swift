//
//  VideoCallPresenter.swift
//  Popin
//
//  Created by Ashwin Nath on 16/03/24.
//

import Foundation

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
    
//    func getVideoCall(callId: Int) {
//        self.videoCallView?.startLoading()
//        self.videoCallInteractor.getCallDetails(callId: callId, onSucess:{ (videoCall) in
//            self.videoCallView?.loadCall(call: videoCall)
//            self.videoCallView?.finishLoading()
//        }, onFailure: { (error) in
//            self.videoCallView?.finishLoading()
//            self.videoCallView?.showMessage(message: error)
//        })
//    }
    
    func acceptCall(callComponentId: Int, callRole: Int) {
        self.videoCallInteractor.notifyAccept(callComponentId: callComponentId, callRole: callRole,  onAccept: { (videoCall) in
            self.videoCallView?.loadCall(call: videoCall)
            self.videoCallView?.finishLoading()
        }, onFailure: { (error) in
            self.videoCallView?.finishLoading()
            self.videoCallView?.showMessage(message: error)
        })
    }
    
    func rejectCall(callComponentId: Int) {
        self.videoCallInteractor.notifyReject(callComponentId: callComponentId)
    }
    
}
