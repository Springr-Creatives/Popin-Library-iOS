//
//  CallAcceptanceWaitHandler.swift
//  PopinCall
//
//  Created on 27/01/26.
//

import Foundation
import Alamofire

protocol CallAcceptanceListener: AnyObject {
    func onQueuePositionChange(position: Int)
    func onCallAccepted(callId: Int)
    func onCallMissed()
}

class CallAcceptanceWaitHandler {
    private static let interval: TimeInterval = 3.0 // 3 seconds
    private static let maxDuration: TimeInterval = 300.0 // 5 minutes

    private let callQueueId: Int
    private weak var listener: CallAcceptanceListener?
    private var timer: Timer?
    private var elapsedTime: TimeInterval = 0
    private var queuePosition: Int = -1
    private var isRunning = false

    init(callQueueId: Int, listener: CallAcceptanceListener) {
        self.callQueueId = callQueueId
        self.listener = listener
    }

    func startWaitingForAcceptance() {
        isRunning = true
        elapsedTime = 0
        print("[CallAcceptanceWaitHandler] Started polling for call_queue_id=\(callQueueId)")
        scheduleNext()
    }

    func stopWaitingForAcceptance() {
        isRunning = false
        timer?.invalidate()
        timer = nil
        print("[CallAcceptanceWaitHandler] Stopped polling")
    }

    private func scheduleNext() {
        guard isRunning, elapsedTime < CallAcceptanceWaitHandler.maxDuration else {
            if elapsedTime >= CallAcceptanceWaitHandler.maxDuration {
                print("[CallAcceptanceWaitHandler] Timed out after 5 minutes")
                stopWaitingForAcceptance()
                listener?.onCallMissed()
            }
            return
        }

        timer = Timer.scheduledTimer(withTimeInterval: CallAcceptanceWaitHandler.interval, repeats: false) { [weak self] _ in
            self?.pollCallUpdate()
        }
    }

    private func pollCallUpdate() {
        guard isRunning else { return }

        let urlString = serverURL + "/user/connect/update"
        let parameters: Parameters = ["call_queue_id": callQueueId]
        let headers = Utilities.shared.getHeaders()

        AF.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
            .responseDecodable(of: UpdateConnectionModel.self) { [weak self] response in
                guard let self = self, self.isRunning else { return }

                self.elapsedTime += CallAcceptanceWaitHandler.interval

                switch response.result {
                case .success(let model):
                    print("[CallAcceptanceWaitHandler] status=\(model.status), position=\(model.position ?? -1), call_id=\(model.call_id ?? -1)")
                    if model.status == 1 {
                        if let position = model.position, position != self.queuePosition {
                            self.queuePosition = position
                            self.listener?.onQueuePositionChange(position: position)
                        }
                    } else if model.status == 2 {
                        self.stopWaitingForAcceptance()
                        if let callId = model.call_id {
                            self.listener?.onCallAccepted(callId: callId)
                        }
                    } else if model.status == 3 {
                        self.stopWaitingForAcceptance()
                        self.listener?.onCallMissed()
                    }

                case .failure(let error):
                    print("[CallAcceptanceWaitHandler] Error: \(error)")
                }

                self.scheduleNext()
            }
    }
}

struct UpdateConnectionModel: Codable {
    let status: Int
    let position: Int?
    let call_id: Int?
    let message: String?
}
