//
//  LoginViewModel.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 12/09/2024.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
   @Published var email: String = ""
   @Published var password: String = ""
   @Published var isEmailValid: Bool = true
   @Published var isPasswordValid: Bool = true
   @Published var canNavigate: Bool = false
   @Published var showError: Bool = false

   private var users: [AppUser] = []

   func validateEmail() {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      isEmailValid = emailPred.evaluate(with: email)
   }

   func validatePassword() {
      isPasswordValid = password.count >= 8
   }

   func loadCredentials() {
      guard let url = URL(string: "http://localhost:3000/users") else {
         print("URL invalide")
         return
      }

      URLSession.shared.dataTask(with: url) { data, response, error in
         if let error = error {
            print("Erreur lors de la requête : \(error)")
            return
         }

         guard let data = data else {
            print("Pas de données reçues")
            return
         }

         do {
            let decoder = JSONDecoder()
            self.users = try decoder.decode([AppUser].self, from: data)
            print("Utilisateurs chargés avec succès : \(self.users.count)")
         } catch {
            print("Erreur lors du décodage : \(error)")
         }
      }.resume()
   }

   func authenticate(completion: @escaping (Bool) -> Void) {
      guard let url = URL(string: "http://localhost:3000/users?email=\(email)") else {
         completion(false)
         return
      }

      URLSession.shared.dataTask(with: url) { data, response, error in
         guard let data = data, error == nil else {
            DispatchQueue.main.async {
               completion(false)
            }
            return
         }

         do {
            let users = try JSONDecoder().decode([AppUser].self, from: data)
            let isAuthenticated = users.contains { $0.email == self.email && $0.password == self.password }
            DispatchQueue.main.async {
               completion(isAuthenticated)
            }
         } catch {
            print("Erreur lors de l'authentification : \(error)")
            DispatchQueue.main.async {
               completion(false)
            }
         }
      }.resume()
   }
}
