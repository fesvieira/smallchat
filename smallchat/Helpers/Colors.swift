//
//  Colors.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 03/05/23.
//

import Foundation
import SwiftUI

extension Color {
    static var raisinBlack = Color(uiColor: .raisinBlack)
    static var razzRed = Color(uiColor: .razzRed)
    static var turqGreen = Color(uiColor: .turqGreen)
    static var lavenderWhite = Color(uiColor: .lavenderWhite)
    static var ultraViolet = Color(uiColor: .ultraViolet)
    static var lightUltraViolet = Color(uiColor: .lightUltraViolet)
    static var davyGray = Color(uiColor: .davyGray)
}

extension UIColor {
    static var raisinBlack = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.00)
    static var razzRed = UIColor(red: 0.86, green: 0.19, blue: 0.41, alpha: 1.00)
    static var turqGreen = UIColor(red: 0.30, green: 0.80, blue: 0.74, alpha: 1.00)
    static var lavenderWhite = UIColor(red: 0.92, green: 0.91, blue: 1.00, alpha: 1.00)
    static var ultraViolet = UIColor(red: 0.39, green: 0.38, blue: 0.63, alpha: 1.00)
    static var lightUltraViolet = UIColor(red: 0.57, green: 0.55, blue: 0.91, alpha: 1.00)
    static var davyGray = UIColor(red: 0.29, green: 0.29, blue: 0.29, alpha: 1.00)
}

extension ShapeStyle where Self == Color {
    static var raisinBlack: Color { .raisinBlack }
    static var razzRed: Color { .razzRed }
    static var turqGreen: Color { .turqGreen }
    static var lavenderWhite: Color { .lavenderWhite }
    static var ultraViolet: Color { .ultraViolet }
    static var lightUltraViolet: Color { .lightUltraViolet }
    static var davyGray: Color { .davyGray }
}
