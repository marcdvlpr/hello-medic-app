//
//  PractitionerViewControllerRepresentable.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 26/08/2024.
//

import SwiftUI

struct PractitionerViewControllerRepresentable: UIViewControllerRepresentable {
   func makeUIViewController(context: Context) -> PractitionerViewController {
      return PractitionerViewController()
   }

   func updateUIViewController(_ uiViewController: PractitionerViewController, context: Context) {
   }
}

struct PractitionerViewControllerRepresentable_Previews: PreviewProvider {
   static var previews: some View {
      PractitionerViewControllerRepresentable()
   }
}
