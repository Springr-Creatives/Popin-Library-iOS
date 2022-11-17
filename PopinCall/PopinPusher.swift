//
//  PopinPusher.swift
//  PopinCall
//
//  Created by Ashwin Nath on 17/11/22.
//

import Foundation
import PusherSwift

class PopinPusher : PusherDelegate{
    
    
    public func connect(callDelegate: PopinCallDelegate) {
        class AuthRequestBuilder: AuthRequestBuilderProtocol {
            func requestFor(socketID: String, channelName: String) -> URLRequest? {
                var request = URLRequest(url: URL(string: "https://dev.popin.to/api/v1/user/channel/authenticate")!)
                request.httpMethod = "POST"
                request.httpBody = "socket_id=\(socketID)&channel_name=\(Utilities().getChannel())".data(using: String.Encoding.utf8)
                request.addValue("Bearer " + Utilities().getUserToken(), forHTTPHeaderField: "Authorization")
                return request
            }
        }
        
        let options = PusherClientOptions(
            authMethod: AuthMethod.authRequestBuilder(authRequestBuilder: AuthRequestBuilder()),
            host: .cluster("ap2")
        )
        
        let pusher = Pusher(key: "b6cb0f549999df3d07a9", options: options)
        pusher.connection.delegate = self;
        pusher.connect()
        
        _ = pusher.bind(eventCallback: { (event: PusherEvent) in
            var message = "Received event: '\(event.eventName)'"
            print(message)
        })
        let pusherChannel = pusher.subscribe(Utilities().getChannel())
        
        
        
    }
    
    
    func changedConnectionState(from old: ConnectionState, to new: ConnectionState) {
        // print the old and new connection states
        print("old: \(old.stringValue()) -> new: \(new.stringValue())")
    }
    
    func subscribedToChannel(name: String) {
        print("Subscribed to \(name)")
    }
    
    func debugLog(message: String) {
        print(message)
    }
    
    func receivedError(error: PusherError) {
        if let code = error.code {
            print("Received error: (\(code)) \(error.message)")
        } else {
            print("Received error: \(error.message)")
        }
    }
    
    
}
