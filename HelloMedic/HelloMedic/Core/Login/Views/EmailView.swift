//
//  EmailView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 01/08/2024.
//

import SwiftUI

struct EmailView: View {
    @Binding var email: String
    @Binding var isEmailValid: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Email")
                .font(.system(size: 18))
                .bold()

            TextField("Entrez votre email", text: $email)
                .padding(.bottom, 5)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .onChange(of: email) { oldValue, newValue in
                    isEmailValid = newValue.contains("@")
                }

            Rectangle()
                .frame(height: 2)
                .foregroundStyle(isEmailValid ? .gray : .red)
                .padding(.bottom, 60)
        }
    }
}

#Preview {
    EmailView(email: .constant(""), isEmailValid: .constant(true))
}
