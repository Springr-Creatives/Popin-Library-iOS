//
//  PopinPusher.swift
//  PopinCall
//
//  Created by Ashwin Nath on 17/11/22.
//

import Foundation
import PusherSwift

class AuthRequestBuilder: AuthRequestBuilderProtocol {
    func requestFor(socketID: String, channelName: String) -> URLRequest? {
        var request = URLRequest(url: URL(string: serverURL + "/user/channel/authenticate")!)
        request.httpMethod = "POST"
        request.addValue("Bearer " + Utilities.shared.getUserToken(), forHTTPHeaderField: "Authorization")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = "socket_id=\(socketID)&channel_name=\(channelName)".data(using: String.Encoding.utf8)
        return request
    }
}

class PopinPusher : PusherDelegate{
    
    private let pusher: Pusher
    var delegate : PopinPusherDelegate?
    
    init() {
        let options = PusherClientOptions(
            authMethod: AuthMethod.authRequestBuilder(authRequestBuilder: AuthRequestBuilder()),
            host: .cluster("ap2"),
            activityTimeout: 10
            
        )
        pusher = Pusher(key: "b6cb0f549999df3d07a9", options: options)
        pusher.delegate = self;
    }
    
    func connect() {
        pusher.connect()
       
        let pusherChannel = pusher.subscribe(Utilities.shared.getChannel())
        pusherChannel.bind(eventName: "user.message", eventCallback: { (event: PusherEvent) -> Void in
            if let dataString = event.data {
                 print("PUSHER_MESSAGE" + dataString)
                 if let data = dataString.data(using: .utf8) {
                     do {
                         if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                            let message = json["message"] as? [String: Any],
                            let type = message["type"] as? Int {
                             
                             if (type == 3) {
                                 Utilities.shared.saveConnected()
                                 self.delegate?.onAgentConnected()
                             } else if (type == 15) {
                                 self.delegate?.onAllExpertsBusy()
                             }
                         }
                     } catch {
                         print("Error parsing pusher message: \(error)")
                     }
                 }
            }
        });
        pusherChannel.bind(eventName: "user.call_cancel", eventCallback: { (event: PusherEvent) -> Void in
            self.delegate?.onCallDisconnected();
        });
        
    }
    
    func changedConnectionState(from old: ConnectionState, to new: ConnectionState) {
        if (new.stringValue() == "connected") {
            self.delegate?.onPusherConnected()
        }
    }
}
