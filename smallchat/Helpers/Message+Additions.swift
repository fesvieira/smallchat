//
//  Message+Additions.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 16/05/23.
//

import Foundation

extension [Message] {
    func getMessageKind(for message: Message) -> MessageView.MessageKind {
        guard let index = self.firstIndex(of: message) else { return .top }
        
        if (index == 0) {
            return .top
        } else if (index == self.count - 1) {
            return.bottom
        } else if (self[index - 1].sender != message.sender) {
            return .top
        } else if (self[index + 1].sender != message.sender) {
            return .bottom
        } else {
            return .mid
        }
    }
}
