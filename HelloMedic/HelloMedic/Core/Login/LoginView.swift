//
//  LoginView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 01/08/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var isEmailValid: Bool = true
    @State private var password: String = ""
    @State private var isPasswordValid: Bool = true

    var body: some View {
        VStack(spacing: 20) {
            LogoView()

            EmailView(
                email: $email,
                isEmailValid: $isEmailValid
            )

            PasswordView(
                password: $password,
                isPasswordValid: $isPasswordValid
            )

            ButtonView(action: {
                print("Login button touched")
            })
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
