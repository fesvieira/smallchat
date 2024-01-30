//
//  Assets.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 26/10/23.
//

import Foundation

enum Asset: String {
    
    case AppIcon
    case MainIcon
    
    var name: String {
        switch self {
        case .AppIcon:
            return "AppIcon"
            
        case .MainIcon:
            return "MainIcon"
        }
    }    
}
