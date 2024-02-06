//
//  StartView.swift
//  FeChatUIKit
//
//  Created by Felipe Vieira on 29/04/23.
//

import SwiftUI
import FirebaseAuth

struct StartView: View {
    @State var email: String = "1@2.com"
    @State var password: String = "123456"
    @State var isPassowordHidden: Bool = true
    
    let onNavigate: () -> Void
    
    var rightPassowordView: some View {
        Text(isPassowordHidden ? "Show" : "Hide")
            .onTapGesture {
                isPassowordHidden.toggle()
            }
            .foregroundColor(.turqGreen)
    }
    var body: some View {
        VStack {
            Image(Asset.MainIcon.name, bundle: nil)
                .renderingMode(.original)
                .resizable()
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                .frame(maxWidth: 200, maxHeight: 200)
                .background(Circle().fill(.lavenderWhite))
                .padding()
            
            FormsTextField(text: $email, placeholder: "Email")
                .textContentType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            FormsTextField(
                text: $password,
                placeholder: "Password",
                isSecure: $isPassowordHidden,
                rightView: AnyView(rightPassowordView)
            )
                .textContentType(.password)
                .textInputAutocapitalization(.never)

            AppButton(text: "Login", action: {
                if !email.isEmpty && !password.isEmpty {
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        guard let error else {
                            print("Success")
                            onNavigate()
                            return
                        }
                        print(error)
                    }
                }
            })
                .padding(.top, 16)
            
            AppButton(text: "Sign Up", style: .empty, action: {
                if !email.isEmpty && !password.isEmpty {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        guard let error else {
                            print("Success")
                            onNavigate()
                            return
                        }
                        print(error)
                    }
                }
            })
                .padding(.top, 8)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.raisinBlack)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(onNavigate: {})
    }
}
