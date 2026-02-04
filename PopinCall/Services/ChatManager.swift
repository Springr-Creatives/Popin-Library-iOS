//
//  ChatManager.swift
//  PopinCall
//
//  Created by Assistant on 04/02/26.
//

import Foundation
import Combine

protocol ChatMessageListener: AnyObject {
    func onMessageReceived(_ message: ChatMessage)
}

class ChatManager: ObservableObject {
    static let shared = ChatManager()

    @Published private(set) var messages: [Int: [ChatMessage]] = [:]
    @Published var unreadCount: Int = 0

    weak var listener: ChatMessageListener?
    private var currentCallId: Int?
    private var currentSellerId: Int?

    private init() {}

    func configure(callId: Int, sellerId: Int) {
        print("[ChatManager] configure - callId: \(callId), sellerId: \(sellerId)")
        self.currentCallId = callId
        self.currentSellerId = sellerId
        if messages[callId] == nil {
            messages[callId] = []
        }
    }

    func getMessages(for callId: Int) -> [ChatMessage] {
        let msgs = messages[callId] ?? []
        print("[ChatManager] getMessages for callId \(callId) - count: \(msgs.count)")
        return msgs
    }

    func clearMessages(for callId: Int) {
        messages[callId] = nil
        unreadCount = 0
    }

    func resetUnreadCount() {
        unreadCount = 0
    }

    func sendMessage(text: String?, image: String? = nil, onSuccess: @escaping () -> Void, onFailure: @escaping (String) -> Void) {
        print("[ChatManager] sendMessage called with text: \(text ?? "nil")")

        guard let sellerId = currentSellerId else {
            print("[ChatManager] ERROR: Seller ID not configured")
            onFailure("Seller ID not configured")
            return
        }

        guard let callId = currentCallId else {
            print("[ChatManager] ERROR: Call ID not configured")
            onFailure("Call ID not configured")
            return
        }

        print("[ChatManager] sendMessage - sellerId: \(sellerId), callId: \(callId)")

        let urlString = serverURL + "/user/message"
        let timezone = TimeZone.current.identifier

        var parameters: [String: Any] = [
            "seller_id": sellerId,
            "tz": timezone
        ]

        if let text = text, !text.isEmpty {
            parameters["text"] = text
        }

        if let image = image, !image.isEmpty {
            parameters["image"] = image
        }

        print("[ChatManager] sendMessage - URL: \(urlString), params: \(parameters)")

        Task {
            do {
                // First get raw response to debug
                let rawResponse: String = try await Utilities.shared.request(
                    urlString: urlString,
                    method: "POST",
                    parameters: parameters
                )
                print("[ChatManager] sendMessage - raw response: \(rawResponse)")

                // Try to parse as JSON to check status
                var isSuccess = true
                if let data = rawResponse.data(using: .utf8),
                   let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                    // Check various success indicators
                    if let status = json["status"] as? Int {
                        isSuccess = (status == 1)
                    } else if let success = json["success"] as? Bool {
                        isSuccess = success
                    }
                    print("[ChatManager] sendMessage - parsed isSuccess: \(isSuccess)")
                }

                if isSuccess {
                    let messageId = UUID().uuidString
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm"
                    let timestamp = formatter.string(from: Date())

                    let chatMessage = ChatMessage(
                        id: messageId,
                        text: text,
                        imageUrl: image,
                        isMe: true,
                        timestamp: timestamp,
                        senderId: nil,
                        senderName: nil
                    )

                    print("[ChatManager] sendMessage - created ChatMessage with id: \(messageId)")

                    await MainActor.run {
                        var updatedMessages = self.messages
                        print("[ChatManager] sendMessage - before update, messages for callId \(callId): \(updatedMessages[callId]?.count ?? 0)")
                        if updatedMessages[callId] == nil {
                            updatedMessages[callId] = []
                        }
                        updatedMessages[callId]?.append(chatMessage)
                        self.messages = updatedMessages
                        print("[ChatManager] sendMessage - after update, messages for callId \(callId): \(self.messages[callId]?.count ?? 0)")
                        onSuccess()
                    }
                } else {
                    print("[ChatManager] sendMessage - FAILED")
                    await MainActor.run {
                        onFailure("Failed to send message")
                    }
                }
            } catch {
                print("[ChatManager] sendMessage - EXCEPTION: \(error.localizedDescription)")
                await MainActor.run {
                    onFailure(error.localizedDescription)
                }
            }
        }
    }

    func handlePusherMessage(_ jsonString: String) {
        guard let callId = currentCallId else { return }

        guard let data = jsonString.data(using: .utf8) else { return }

        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let messageObj = json["message"] as? [String: Any] {

                let messageId = messageObj["message_id"] as? String
                    ?? (messageObj["id"] as? Int).map { String($0) }
                    ?? UUID().uuidString
                var text: String?
                var imageUrl: String?

                if let dataObj = messageObj["data"] as? [String: Any] {
                    text = dataObj["text"] as? String
                    imageUrl = dataObj["image"] as? String
                }

                let timestamp = messageObj["created_at_formatted"] as? String ?? ""
                let sellerId = messageObj["seller_id"] as? Int
                // Prefer agent_name over seller_name for incoming messages
                let agentName = messageObj["agent_name"] as? String ?? messageObj["seller_name"] as? String

                // Use direction to determine if message is from user (0) or agent (1)
                // direction = 0 means sent by user, direction = 1 means from agent
                let direction = messageObj["direction"] as? Int ?? 1
                let isMe = (direction == 0)

                // Only process if it has text or image content
                if text != nil || imageUrl != nil {
                    let chatMessage = ChatMessage(
                        id: messageId,
                        text: text,
                        imageUrl: imageUrl,
                        isMe: isMe,
                        timestamp: timestamp,
                        senderId: sellerId,
                        senderName: agentName
                    )

                    DispatchQueue.main.async {
                        var updatedMessages = self.messages
                        if updatedMessages[callId] == nil {
                            updatedMessages[callId] = []
                        }
                        // Avoid duplicates
                        if !updatedMessages[callId]!.contains(where: { $0.id == chatMessage.id }) {
                            updatedMessages[callId]?.append(chatMessage)
                            self.messages = updatedMessages
                            // Only increment unread for received messages
                            if !isMe {
                                self.unreadCount += 1
                            }
                            self.listener?.onMessageReceived(chatMessage)
                        }
                    }
                }
            }
        } catch {
            print("Error parsing chat message: \(error)")
        }
    }
}
