//
//  PractitionerCardViewViewController.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 26/08/2024.
//

import UIKit

class PractitionerViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white

      let cardView = PractitionerCardView()
      cardView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(cardView)

         // Contraintes pour la carte
      NSLayoutConstraint.activate([
         cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
         cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         cardView.widthAnchor.constraint(equalToConstant: 360),
         cardView.heightAnchor.constraint(equalToConstant: 170)
      ])
   }
}


