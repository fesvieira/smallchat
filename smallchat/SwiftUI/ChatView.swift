//
//  ChatView.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 14/05/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var messages: MessagesObservable
    let onSendPressed: (String) -> Void
    let sender: String
    
    @State private var messageText: String = ""
    
    var sendButton: some View {
        Image(systemName: "paperplane.fill")
            .resizable()
            .frame(width: 24, height: 24)
            .foregroundColor(.lightUltraViolet)
            .onTapGesture {
                onSendPressed(messageText)
            }
    }
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(messages.messages, id: \.self) { message in
                        let isLoggedUser = message.sender == sender
                        let messageKind = messages.messages.getMessageKind(for: message)
                        let showUsername = messageKind == .top
                        
                        MessageView(
                            username: showUsername ? message.sender : nil,
                            text: message.body,
                            isLoggedUser: isLoggedUser,
                            kind: messageKind
                        )
                    }
                }
            }
            
            FormsTextField(
                text: $messageText,
                placeholder: "Type your message...",
                rightView: AnyView(sendButton)
            )
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.raisinBlack)
    }
}
