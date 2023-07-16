//
//  UIViewController+.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 29/04/23.
//

import Foundation
import UIKit
import SwiftUI

extension UIViewController {
    func addSwiftUI(_ rootView: any View) {
        let vc = UIHostingController(rootView: AnyView(rootView))

        let swiftuiView = vc.view!
        swiftuiView.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(vc)
        view.addSubview(swiftuiView)
        
        NSLayoutConstraint.activate([
            swiftuiView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            swiftuiView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            swiftuiView.topAnchor.constraint(equalTo: view.topAnchor),
            swiftuiView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        vc.didMove(toParent: self)
    }
}
