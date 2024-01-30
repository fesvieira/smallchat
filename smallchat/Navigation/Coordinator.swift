//
//  Coordinator.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 03/06/23.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}


