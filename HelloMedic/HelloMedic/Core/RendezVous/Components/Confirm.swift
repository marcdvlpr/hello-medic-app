//
//  Confirm.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 14/09/2024.
//

import SwiftUI

struct Confirm: View {
   @State private var isShowingSheet = false

   var body: some View {
      VStack {
         Text("Merci !")
            .font(.title)
            .padding(50)
         Text("""
                  Votre rendez-vous 
                     est confirmé !
               """)
         .multilineTextAlignment(.center)
         .font(.title2)
      }
      .presentationDetents([.height(200)])
   }
}

#Preview {
   Confirm()
}
