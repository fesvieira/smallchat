//
//  AppButton.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 07/05/23.
//

import SwiftUI

enum AppButtonStyle {
    case filled
    case empty
}

struct AppButton: View {
    private let text: String
    private let style: AppButtonStyle
    private let action: () -> Void
    
    init(
        text: String,
        style: AppButtonStyle = .filled,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.action = action
    }
    
    var body: some View {
        
        Button(
            action: {
                action()
            },
            label: {
                Text(text)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(style == .filled ? .raisinBlack : .lightUltraViolet)
                    .padding(.vertical, 14)
                    .frame(maxWidth: .infinity)
                    .background(style == .filled ? .lightUltraViolet : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .overlay {
                        RoundedRectangle(cornerRadius: 32).stroke(style == .filled ? .clear : .ultraViolet, lineWidth: 2)
                    }
            }
        )
        .buttonStyle(ScaleButtonStyle())
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.05 : 1)
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            AppButton(
                text: "Button",
                style: .empty,
                action: {}
            )
            .padding(.horizontal)
            
            AppButton(
                text: "Button",
                style: .filled,
                action: {}
            )
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.raisinBlack)
        
    }
}
