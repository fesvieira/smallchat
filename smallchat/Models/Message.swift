//
//  Message.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 14/05/23.
//

import Foundation

struct Message: Hashable, Identifiable {
    let id = UUID()
    let sender: String
    let body: String
}
