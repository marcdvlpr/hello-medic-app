//
//  PractitionerCardViewRepresentable.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 14/09/2024.
//

import SwiftUI
import UIKit

struct PractitionerCardViewRepresentable: UIViewRepresentable {
   var careGiver: CareGiver

   func makeUIView(context: Context) -> PractitionerCardView {
      return PractitionerCardView()
   }

   func updateUIView(_ uiView: PractitionerCardView, context: Context) {
      uiView.configure(with: careGiver)
   }
}
