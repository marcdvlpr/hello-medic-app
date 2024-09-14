//
//  LoginView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 01/08/2024.
//

import SwiftUI

struct LoginView: View {
   @StateObject private var viewModel = LoginViewModel()

   var body: some View {
      NavigationStack {
         VStack(spacing: 10) {
            LogoView()

            EmailView(
               email: $viewModel.email,
               isEmailValid: $viewModel.isEmailValid
            )

            PasswordView(
               password: $viewModel.password,
               isPasswordValid: $viewModel.isPasswordValid
            )
            .autocapitalization(.none)

            Button(action: {
               viewModel.validateEmail()
               viewModel.validatePassword()

               if viewModel.isEmailValid && viewModel.isPasswordValid {
                  viewModel.authenticate { success in
                     viewModel.canNavigate = success
                     viewModel.showError = !success
                  }
               } else {
                  viewModel.canNavigate = false
                  viewModel.showError = true
               }
            }) {
               Text(viewModel.showError ? "Informations invalides" : "Se connecter")
                  .padding()
                  .frame(maxWidth: .infinity)
                  .background(viewModel.showError ? Color.red : Color.blue)
                  .foregroundStyle(.white)
                  .cornerRadius(8)
            }

            .navigationDestination(isPresented: $viewModel.canNavigate) {
               TabBarView().navigationBarBackButtonHidden()
            }

            HStack {
               NavigationLink {
                  RegisterViewTwo()
               } label: {
                  HStack {
                     Text("Vous n'avez pas de compte ?")
                        .font(.system(size: 14))
                  }
               }
            }
         }
         .padding()
         .onAppear {
            viewModel.loadCredentials()
         }
      }
   }
}

#Preview {
   LoginView()
}
