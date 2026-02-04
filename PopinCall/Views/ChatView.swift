//
//  ChatView.swift
//  PopinCall
//
//  Created by Assistant on 04/02/26.
//

import SwiftUI

#if canImport(UIKit)

struct ChatView: View {
    let callId: Int
    let onClose: () -> Void

    @ObservedObject private var chatManager = ChatManager.shared
    @State private var messageText: String = ""
    @State private var isSending: Bool = false

    private var messages: [ChatMessage] {
        chatManager.getMessages(for: callId)
    }

    var body: some View {
        VStack(spacing: 0) {
            // Top Bar
            ChatTopBar(onClose: onClose)

            // Messages List
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(messages) { message in
                            ChatBubble(message: message)
                                .id(message.id)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                }
                .onChange(of: messages.count) { _ in
                    if let lastMessage = messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
                .onAppear {
                    if let lastMessage = messages.last {
                        proxy.scrollTo(lastMessage.id, anchor: .bottom)
                    }
                }
            }

            // Input Bar
            MessageInputBar(
                messageText: $messageText,
                isSending: isSending,
                onSend: sendMessage
            )
        }
        .background(Color(hex: "1A1D21"))
        .onAppear {
            chatManager.resetUnreadCount()
        }
    }

    private func sendMessage() {
        let trimmedText = messageText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }

        isSending = true
        let textToSend = trimmedText
        messageText = ""

        chatManager.sendMessage(
            text: textToSend,
            image: nil,
            onSuccess: {
                self.isSending = false
            },
            onFailure: { _ in
                self.isSending = false
            }
        )
    }
}

// MARK: - Chat Top Bar

struct ChatTopBar: View {
    let onClose: () -> Void

    var body: some View {
        HStack {
            Text("Chat with expert")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)

            Spacer()

            Button(action: onClose) {
                Image(systemName: "xmark")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(Color.white.opacity(0.2))
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(hex: "2A2F33"))
    }
}

// MARK: - Chat Bubble

struct ChatBubble: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.isMe {
                Spacer(minLength: 60)
            }

            VStack(alignment: message.isMe ? .trailing : .leading, spacing: 4) {
                // Sender name for agent messages
                if !message.isMe, let senderName = message.senderName {
                    Text(senderName)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                }

                // Message content
                VStack(alignment: .leading, spacing: 8) {
                    // Image if present
                    if let imageUrl = message.imageUrl, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 200, height: 150)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200)
                                    .cornerRadius(8)
                            case .failure:
                                Image(systemName: "photo")
                                    .foregroundColor(.gray)
                                    .frame(width: 200, height: 150)
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }

                    // Text if present
                    if let text = message.text, !text.isEmpty {
                        Text(text)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                    }

                    // Timestamp
                    Text(message.timestamp)
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(message.isMe ? Color(hex: "4CAF50") : Color(hex: "3E4347"))
                .cornerRadius(16)
            }

            if !message.isMe {
                Spacer(minLength: 60)
            }
        }
    }
}

// MARK: - Message Input Bar

struct MessageInputBar: View {
    @Binding var messageText: String
    let isSending: Bool
    let onSend: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            TextField("Type a message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color(hex: "3E4347"))
                .cornerRadius(24)
                .foregroundColor(.white)

            Button(action: onSend) {
                if isSending {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(width: 44, height: 44)
                } else {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(Color(hex: "4CAF50"))
                        .clipShape(Circle())
                }
            }
            .disabled(messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isSending)
            .opacity(messageText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(hex: "2A2F33"))
    }
}

#endif
