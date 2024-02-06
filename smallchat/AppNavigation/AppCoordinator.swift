//
//  AppCoordinator.swift
//  smallchat
//
//  Created by Felipe Vieira on 06/02/24.
//

import XCoordinator
import Foundation
import UIKit

class AppCoordinator: NavigationCoordinator<AppRoute> {
    init() {
        super.init(initialRoute: .start)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
            
        case .start:
            let viewController = StartViewController()
            return(.push(viewController))
        case .chat:
            let viewController = ChatViewController()
            return(.push(viewController))
                
        }
    }
}
