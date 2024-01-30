//
//  Constants.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 08/05/23.
//

import Foundation

struct K {
    struct Segues {
        static let chatSegue = "loginToChat"
        static let loginSegue = "chatToLogin"
    }
    struct Controllers {
        static let loginViewController = "LoginViewController"
        static let chatViewController = "ChatViewController"
    }
    struct FStore {
        static let collectionName = "MessagesDataset"
        static let dateField = "dateField"
        static let senderField = "senderField"
        static let bodyField = "bodyField"
    }
}
