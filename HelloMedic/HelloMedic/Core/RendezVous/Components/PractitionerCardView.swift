//
//  PractitionerCardView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 26/08/2024.
//

import UIKit

class PractitionerCardView: UIView {
   private let imageView = UIImageView()
   private let nameLabel = UILabel()
   private let specialtyLabel = UILabel()

   override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
   }

   required init?(coder: NSCoder) {
      super.init(coder: coder)
      setupView()
   }

   private func setupView() {
         // Configuration de base de la card
      backgroundColor = UIColor.systemBlue
      layer.cornerRadius = 25
      layer.shadowColor = UIColor.black.cgColor
      layer.shadowOpacity = 0.1
      layer.shadowOffset = CGSize(width: 0, height: 2)
      layer.shadowRadius = 4

      setupSubviews()
   }

   private func setupSubviews() {
         // Image du soignant
      imageView.translatesAutoresizingMaskIntoConstraints = false
      imageView.contentMode = .scaleAspectFill
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 40
      addSubview(imageView)

         // Nom et prénom du soignant
      nameLabel.translatesAutoresizingMaskIntoConstraints = false
      nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
      nameLabel.textColor = .white
      addSubview(nameLabel)

         // Spécialité du soignant
      specialtyLabel.translatesAutoresizingMaskIntoConstraints = false
      specialtyLabel.font = UIFont.systemFont(ofSize: 16)
      specialtyLabel.textColor = .white
      addSubview(specialtyLabel)

         // Contraintes pour les sous-vues
      NSLayoutConstraint.activate([
         imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
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

   func configure(with careGiver: CareGiver) {
      imageView.image = UIImage(named: careGiver.image)
      nameLabel.text = careGiver.name
      specialtyLabel.text = careGiver.specialty
   }
}


