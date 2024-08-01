//
//  PasswordViewComponent.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 01/08/2024.
//

import SwiftUI

struct PasswordViewComponent: View {
    @Binding var password: String
    @Binding var isPasswordValid: Bool
    @State var isPasswordVisible: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Password")
                .font(.system(size: 18))
                .bold()

            HStack {
                Group {
                    if isPasswordVisible {
                        TextField("Enter your pasword", text: $password)
                            .padding(.bottom, 5)
                    } else {
                        SecureField("Enter yout password", text: $password)
                    }
                }
                .padding(.bottom, 5)
                Button(action: {
                    isPasswordVisible.toggle()
                }) {
                    Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                        .foregroundStyle(.gray)
                }
            }
            Rectangle()
                .frame(height:2)
                .foregroundStyle(isPasswordValid ? .gray : .red)
        }
        .onChange(of: password) {oldValue, newValue in
            isPasswordValid = newValue.count >= 8
        }
        Spacer()
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var password: String = ""
        @State var isPasswordValid: Bool = true

        var body: some View {
            PasswordViewComponent(password: $password, isPasswordValid: $isPasswordValid)
        }
    }

    return PreviewWrapper()
}
