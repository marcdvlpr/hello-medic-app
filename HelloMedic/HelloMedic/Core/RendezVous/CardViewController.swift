//
//  CardViewController.swift
//  SearchView3Correct
//
//  Created by Apprenant 125 on 08/08/2024.
//

import UIKit

class CardViewController: UIViewController {
    // Création d'une instance de CardView
    private let cardView = CardView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // Configuration de l'interface utilisateur
    }

    private func setupUI() {
        view.addSubview(cardView) // Ajout de cardView à la vue principale
        cardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Centrage horizontal de cardView
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Positionnement de cardView à 50 points du haut de la vue principale
            cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),

        ])
    }
}

#if DEBUG
#Preview {
    CardViewController() // Prévisualisation pour le débogage
}
#endif
