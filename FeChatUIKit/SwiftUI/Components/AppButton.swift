//
//  AppButton.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 07/05/23.
//

import SwiftUI

enum ButtonStyle {
    case filled
    case empty
}

struct AppButton: View {
    private let text: String
    private let style: ButtonStyle
    private let action: () -> Void
    
    init(
        text: String,
        style: ButtonStyle = .filled,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.action = action
    }
    
    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(style == .filled ? .raisinBlack : .ultraViolet)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(style == .filled ? .ultraViolet : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 32))
            .overlay {
                RoundedRectangle(cornerRadius: 32).stroke(style == .filled ? .clear : .ultraViolet, lineWidth: 2)
            }
            .onTapGesture {
                action()
            }
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        AppButton(
            text: "Button",
            style: .empty,
            action: {}
        )
        .padding(.horizontal)
    }
}
