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
                Text("Se connecter")
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            HStack {
                Text("Vous n'avez pas de compte ?")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.system(size: 15))
                Button("Enregistrez-vous !") {
                    // Action for login
                }
                .font(.system(size: 15))
                Button("Enregistrez-vous !") {
                    // Action for Sign Up
                }
                .font(.system(size: 15))
            }
        }
        Spacer()
    }
}

#Preview {
    ButtonViewComponent(action: {print("Button was touched") })
}
