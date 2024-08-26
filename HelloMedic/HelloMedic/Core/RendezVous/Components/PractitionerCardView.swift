//
//  PractitionerCardView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 26/08/2024.
//

import UIKit

class PractitionerCardView: UIView {
   private let backgroundView = UIView()
      // Initialisation de la vue
   override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
      setupView()
   }

      // Configuration de la vue
   private func setupView() {
         // Configuration de base de la carte
      backgroundColor = UIColor.systemBlue
      layer.cornerRadius = 25
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.1
      layer.shadowOffset = CGSize(width: 0, height: 2)
      layer.shadowRadius = 4

         // Ajout des sous-vues ici
      setupSubviews()
   }

   private func setupSubviews() {
         // Image du médecin
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 40
      imageView.image = UIImage(named: "drfrancois")
      addSubview(imageView)

         // Nom et prénom du médecin
      let nameLabel = UILabel()
      nameLabel.translatesAutoresizingMaskIntoConstraints = false
      nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
      nameLabel.textColor = .white
      nameLabel.text = "Dr. Benhamou David"
      addSubview(nameLabel)

         // Spécialité du médecin
      let specialtyLabel = UILabel()
      specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
      specialtyLabel.font = UIFont.systemFont(ofSize: 16)
      specialtyLabel.textColor = .white
      specialtyLabel.text = "Généraliste"
      addSubview(specialtyLabel)

         // Contraintes pour les sous-vues
      NSLayoutConstraint.activate([
         imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
         imageView.widthAnchor.constraint(equalToConstant: 80),
         imageView.heightAnchor.constraint(equalToConstant: 80),

         nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
         nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
         nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),

         specialtyLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
         specialtyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
         specialtyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
      ])
   }
}



