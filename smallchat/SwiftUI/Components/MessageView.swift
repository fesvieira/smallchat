//
//  MessageView.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 14/05/23.
//

import SwiftUI

struct MessageView: View {
    let username: String?
    let text: String
    let isLoggedUser: Bool
    let kind: MessageKind
    
    init(username: String?, text: String, isLoggedUser: Bool, kind: MessageKind) {
        self.username = username
        self.text = text
        self.isLoggedUser = isLoggedUser
        self.kind = kind
    }
    
    private var messageShape: some View {
        if (isLoggedUser) {
            switch kind {
            case .top:
                return AbsoluteRoundedRectangle(27, 27, 8, 27)
                    .fill(.ultraViolet)
                    .frame(minWidth: 50, minHeight: 50)
            case .mid:
                return AbsoluteRoundedRectangle(left: 27, right: 8)
                    .fill(.ultraViolet)
                    .frame(minWidth: 50, minHeight: 50)
            case .bottom:
                return AbsoluteRoundedRectangle(27, 8, 27, 27)
                    .fill(.ultraViolet)
                    .frame(minWidth: 50, minHeight: 50)
            }
        } else {
            switch kind {
            case .top:
                return AbsoluteRoundedRectangle(27, 27, 27, 8)
                    .fill(.ultraViolet)
                    .frame(minWidth: 50, minHeight: 50)
            case .mid:
                return AbsoluteRoundedRectangle(left: 8, right: 27)
                    .fill(.ultraViolet)
                    .frame(minWidth: 50, minHeight: 50)
            case .bottom:
                return AbsoluteRoundedRectangle(8, 27, 27, 27)
                    .fill(.ultraViolet)
                    .frame(minWidth: 50, minHeight: 50)
            }
        }
        
    }
    
    var body: some View {
        VStack(alignment: isLoggedUser ? .trailing : .leading, spacing: 0) {
            if let username {
                Text(username)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 4)
            }
            
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(16)
                .background(messageShape)
        }
        .frame(maxWidth: .infinity, alignment: isLoggedUser ? .trailing : .leading)
    }
}

extension MessageView {
    enum MessageKind {
        case top, mid, bottom
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack {
            MessageView(
                username: "TestingBot",
                text: "A very long message content that will help testing how this ballon grows",
                isLoggedUser: false,
                kind: .top
            )
            MessageView(
                username: nil,
                text: "A very long message content this ballon grows",
                isLoggedUser: false,
                kind: .mid
            )
            MessageView(
                username: nil,
                text: "A very long message content that will help testing how this ballon grows",
                isLoggedUser: false,
                kind: .bottom
            )
            MessageView(
                username: "TestingBot",
                text: "A very long message content that will help testing how this ballon grows",
                isLoggedUser: true,
                kind: .top
            )
            MessageView(
                username: nil,
                text: "A very long ",
                isLoggedUser: true,
                kind: .mid
            )
            MessageView(
                username: nil,
                text: "A very long message content that will help testing how this ballon grows",
                isLoggedUser: true,
                kind: .bottom
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.raisinBlack)
    }
}
