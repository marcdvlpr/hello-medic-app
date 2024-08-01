//
//  ButtonViewComponent.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 01/08/2024.
//

import SwiftUI

struct ButtonViewComponent: View {
    var action: () -> Void

    var body: some View {
        VStack {
            Button(action: action) {
                Text("Login")
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            HStack {
                Text("You already have an account?")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 15))
                Button("Login") {
                    // Action for login
                }
                .font(.system(size: 15))
                Text("if not")
                    .font(.system(size: 15))
                Button("SignUp") {
                    // Action for Sign Up
                }
                .font(.system(size: 15))
            }
            .frame(maxWidth: .infinity)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
        }
        Spacer()
    }
}

#Preview {
    ButtonViewComponent(action: {print("Button was touched") })
}
