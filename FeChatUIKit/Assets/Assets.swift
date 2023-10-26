//
//  Assets.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 26/10/23.
//

import Foundation

enum Assets {
    case AppIcon
    
    var name: String {
        switch self {
        case .AppIcon:
            return "AppIcon"
        }
    }
}
