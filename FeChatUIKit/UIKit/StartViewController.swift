//
//  ViewController.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 29/04/23.
//

import UIKit
import SwiftUI

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSwiftUI(
            StartView(
                onNavigate: { [weak self] in
                    self?.performSegue(withIdentifier: K.Segues.chatSegue, sender: self)
                }
            )
        )
    }
}
