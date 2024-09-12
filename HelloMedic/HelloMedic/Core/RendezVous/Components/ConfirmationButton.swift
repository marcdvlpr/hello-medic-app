//
//  ConfirmationButton.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 25/08/2024.
//

import SwiftUI

struct ConfirmationButton: View {
   var body: some View {
      Button(action: {
         print("Le bouton a été cliqué")
      }) {
         Text("Confirmer votre rendez-vous")
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
      }
      Spacer()
   }
}
