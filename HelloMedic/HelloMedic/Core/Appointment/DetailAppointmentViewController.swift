//
//  DetailAppointmentViewController.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import UIKit
import SwiftUI

class DetailAppointmentViewController : UIViewController {
    
    let composantMotif = ComposantView(nameSection: "Motif", imageSection: UIImage(systemName: "message.fill") ?? UIImage(), textSection: "Rappel Vaccin")
    let composantPlace = ComposantView(nameSection: "Lieu", imageSection: UIImage(systemName: "location.fill") ?? UIImage(), textSection: "12 rue des Peupliers\n75008")
    let composantPhone = ComposantView(nameSection: "Contact", imageSection: UIImage(systemName: "phone.fill") ?? UIImage(), textSection: "01 12 23 34 56")
    let composantPay = ComposantView(nameSection: "Modalités paiement", imageSection: UIImage(systemName: "creditcard.fill") ?? UIImage(), textSection: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée")
    
    let profilSpecialistButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setComposants()
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            // Apply rounded corners here to ensure bounds are set
            applyRoundedCornersToComponents()
        }
    
    func setComposants() {
        let rectangle = UIView()
        
        let calendarImageView = UIImageView()
        let dateLabel = UILabel()
        let dateHStack = UIStackView(arrangedSubviews: [calendarImageView, dateLabel])
        
        let timerImageView = UIImageView()
        let timeLabel = UILabel()
        let timeHStack = UIStackView(arrangedSubviews: [timerImageView, timeLabel])
        
        let divider = UIView()
        
        let specialistImageView = UIImageView()
        let specialistNameLabel = UILabel()
        let specialistSpeciality = UILabel()
        let specialistVStack = UIStackView(arrangedSubviews: [specialistNameLabel, specialistSpeciality])
        let specialistHStack = UIStackView(arrangedSubviews: [specialistImageView, specialistVStack])
        
        let profilSpecialistLabel = UILabel()
        let profilSpecialistImageView = UIImageView()
        let profilSpecialistHStack = UIStackView(arrangedSubviews: [profilSpecialistLabel,profilSpecialistImageView])
        
        let cancelButton = UIButton()
        var configurationCancelButton = UIButton.Configuration.filled()
        let modifyButton = UIButton()
        var configurationModifyButton = UIButton.Configuration.filled()
        let buttonsHStack = UIStackView(arrangedSubviews: [cancelButton, modifyButton])
        
        rectangle.backgroundColor = .hmBlue
        rectangle.layer.cornerRadius = 14
        
        calendarImageView.image = UIImage(systemName: "calendar")
        calendarImageView.tintColor = .white
        
        dateLabel.text = "Date de date"
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dateLabel.textColor = .white
        
        dateHStack.axis = .horizontal
        dateHStack.spacing = 3
        dateHStack.alignment = .center
        
        timerImageView.image = UIImage(systemName: "timer")
        timerImageView.tintColor = .white
        
        timeLabel.text = "00:00"
        timeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        timeLabel.textColor = .white
        
        timeHStack.axis = .horizontal
        timeHStack.spacing = 3
        timeHStack.alignment = .center
        
        divider.backgroundColor = .white
        
        specialistNameLabel.text = "Dr Mérédith ATELAF"
        specialistNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        specialistNameLabel.textColor = .white
        
        specialistSpeciality.text = "Médecin"
        specialistSpeciality.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        specialistSpeciality.textColor = .white
        
        specialistVStack.axis = .vertical
        specialistVStack.spacing = 1
        specialistVStack.alignment = .leading
        
        specialistImageView.image = UIImage(named: "drmeredith")
        specialistImageView.clipsToBounds = true
        specialistImageView.layer.cornerRadius = 38
        specialistImageView.contentMode = .scaleAspectFill
        
        specialistHStack.axis = .horizontal
        specialistHStack.spacing = 8
        specialistHStack.alignment = .center
        
        profilSpecialistButton.backgroundColor = .hmBlue
        profilSpecialistButton.addTarget(self, action: #selector(navigateToSpecialistProfile), for: .touchUpInside)
        
        profilSpecialistLabel.text = "Consulter la fiche du praticien"
        profilSpecialistLabel.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        profilSpecialistLabel.textColor = .white
        profilSpecialistImageView.image = UIImage(systemName: "chevron.right")
        profilSpecialistImageView.tintColor = .white
        profilSpecialistHStack.spacing = 15
        
        // Modifier la taille du titre
       let titleFont = UIFont.systemFont(ofSize: 14, weight: .medium)
       configurationCancelButton.attributedTitle = AttributedString("Annuler", attributes: AttributeContainer([.font: titleFont]))
       
       // Modifier la taille de l'image
       let imageConfig = UIImage.SymbolConfiguration(pointSize: 11, weight: .bold)
       configurationCancelButton.preferredSymbolConfigurationForImage = imageConfig
        
        configurationCancelButton.image = UIImage(systemName: "xmark")
        configurationCancelButton.imagePadding = 5  // Espace entre l'image et le texte
        configurationCancelButton.imagePlacement = .leading  // Image à gauche du texte
        configurationCancelButton.baseBackgroundColor = .hmSkyBlue
        configurationCancelButton.baseForegroundColor = .white
        
        cancelButton.configuration = configurationCancelButton
        cancelButton.layer.cornerRadius = 14
        cancelButton.clipsToBounds = true
        
       configurationModifyButton.attributedTitle = AttributedString("Modifier", attributes: AttributeContainer([.font: titleFont]))
       
       // Modifier la taille de l'image
       configurationModifyButton.preferredSymbolConfigurationForImage = imageConfig
        
        configurationModifyButton.image = UIImage(systemName: "pencil")
        configurationModifyButton.imagePadding = 5  // Espace entre l'image et le texte
        configurationModifyButton.imagePlacement = .leading  // Image à gauche du texte
        configurationModifyButton.baseBackgroundColor = .white
        configurationModifyButton.baseForegroundColor = .hmSkyBlue
        
        modifyButton.configuration = configurationModifyButton
        modifyButton.layer.cornerRadius = 14
        modifyButton.clipsToBounds = true
        
        buttonsHStack.spacing = 29
        
        self.view.addSubview(rectangle)
        self.view.addSubview(dateHStack)
        self.view.addSubview(timeHStack)
        self.view.addSubview(divider)
        self.view.addSubview(specialistHStack)
        self.view.addSubview(composantMotif)
        self.view.addSubview(composantPlace)
        self.view.addSubview(composantPhone)
        self.view.addSubview(composantPay)
        self.view.addSubview(profilSpecialistButton)
        self.view.addSubview(profilSpecialistHStack)
        self.view.addSubview(buttonsHStack)
        
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateHStack.translatesAutoresizingMaskIntoConstraints = false
        timeHStack.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        specialistHStack.translatesAutoresizingMaskIntoConstraints = false
        composantMotif.translatesAutoresizingMaskIntoConstraints = false
        composantPlace.translatesAutoresizingMaskIntoConstraints = false
        composantPhone.translatesAutoresizingMaskIntoConstraints = false
        composantPay.translatesAutoresizingMaskIntoConstraints = false
        profilSpecialistButton.translatesAutoresizingMaskIntoConstraints = false
        profilSpecialistHStack.translatesAutoresizingMaskIntoConstraints = false
        buttonsHStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rectangle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 7),
            rectangle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -7),
            rectangle.widthAnchor.constraint(equalToConstant: 379),
            rectangle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16),
            rectangle.bottomAnchor.constraint(equalTo: buttonsHStack.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            dateHStack.topAnchor.constraint(equalTo: rectangle.topAnchor, constant: 10),
            dateHStack.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate([
            timeHStack.topAnchor.constraint(equalTo: rectangle.topAnchor, constant: 10),
            timeHStack.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: dateHStack.bottomAnchor, constant: 10),
            divider.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            divider.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            specialistImageView.widthAnchor.constraint(equalToConstant: 76),
            specialistImageView.heightAnchor.constraint(equalToConstant: 76),
            specialistHStack.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 25),
            specialistHStack.centerXAnchor.constraint(equalTo: rectangle.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            composantMotif.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            composantMotif.topAnchor.constraint(equalTo: specialistHStack.bottomAnchor, constant: 25),
            composantMotif.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantMotif.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            composantPlace.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            composantPlace.topAnchor.constraint(equalTo: composantMotif.bottomAnchor, constant: 10),
            composantPlace.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantPlace.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            composantPhone.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            composantPhone.topAnchor.constraint(equalTo: composantPlace.bottomAnchor, constant: 2),
            composantPhone.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantPhone.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            composantPay.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            composantPay.topAnchor.constraint(equalTo: composantPhone.bottomAnchor, constant: 2),
            composantPay.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantPay.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            profilSpecialistButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            profilSpecialistButton.topAnchor.constraint(equalTo: composantPay.bottomAnchor, constant: 2),
            profilSpecialistButton.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            profilSpecialistButton.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            profilSpecialistButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            profilSpecialistHStack.centerXAnchor.constraint(equalTo: profilSpecialistButton.centerXAnchor),
            profilSpecialistHStack.centerYAnchor.constraint(equalTo: profilSpecialistButton.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonsHStack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonsHStack.topAnchor.constraint(equalTo: profilSpecialistButton.bottomAnchor, constant: 16),
            cancelButton.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        self.view.layoutIfNeeded()
    }
    
    @objc func navigateToSpecialistProfile() {
        print("Navigate to specialist profile tapped")
        // Présenter la vue SwiftUI avec UIHostingController
        let hostingController = UIHostingController(rootView: ProfilSpecialistView())
        // Créer un UINavigationController si vous voulez que la vue SwiftUI soit dans une pile de navigation
        let navigationController = UINavigationController(rootViewController: hostingController)
        
        // Présenter le UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func applyRoundedCornersToComponents() {
            // Appliquer les coins arrondis après la mise à jour des contraintes
        composantMotif.applyRoundedCorners(cornerRadii: [14,14,14,14])
        composantPlace.applyRoundedCorners(cornerRadii: [14,14,0,0])
        profilSpecialistButton.applyRoundedCorners(cornerRadii: [0,0,14,14])
    }
}

class ComposantView: UIView {
    
    var nameSection : String
    var imageSection : UIImage
    var textSection : String
    
    init(nameSection: String, imageSection: UIImage, textSection: String) {
        self.nameSection = nameSection
        self.imageSection = imageSection
        self.textSection = textSection
        super.init(frame: .zero)
        setupView()
    }
    
        
    required init?(coder: NSCoder) {
        self.nameSection = ""
        self.imageSection = UIImage()
        self.textSection = ""
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Configuration de la vue
        self.backgroundColor = .white
        
        // Ajouter des sous-vues et des contraintes
        let composantImageView = UIImageView()
        let composantLabel = UILabel()
        let composantHStack = UIStackView(arrangedSubviews: [composantImageView, composantLabel])
        let textComposantLabel = UILabel()
        
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowOpacity = 0.3
        
        composantLabel.text = nameSection
        composantLabel.textColor = .hmBlue
        composantLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        
        composantImageView.image = imageSection
        composantImageView.tintColor = .hmBlue
        
        composantHStack.axis = .horizontal
        composantHStack.spacing = 3
        composantHStack.alignment = .center
        
        textComposantLabel.text = textSection
        textComposantLabel.numberOfLines = 0 // Permet au label de s'ajuster sur plusieurs lignes
        textComposantLabel.lineBreakMode = .byWordWrapping
        textComposantLabel.textColor = .hmBlue
        textComposantLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        textComposantLabel.textAlignment = .center
        if imageSection == UIImage(systemName: "creditcard.fill") {
            textComposantLabel.textAlignment = .left
        }
        
        composantHStack.translatesAutoresizingMaskIntoConstraints = false
        composantLabel.translatesAutoresizingMaskIntoConstraints = false
        composantImageView.translatesAutoresizingMaskIntoConstraints = false
        textComposantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(composantHStack)
        addSubview(textComposantLabel)
        
        NSLayoutConstraint.activate([
            composantHStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            composantHStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            self.bottomAnchor.constraint(equalTo: textComposantLabel.bottomAnchor, constant: 30),
            textComposantLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 37),
            textComposantLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
}

extension UIView {
    func applyRoundedCorners(cornerRadii: [CGFloat]) {
        let path = UIBezierPath()
        let width = self.bounds.width
        let height = self.bounds.height
        
        let topLeftRadius = cornerRadii[0]
        let topRightRadius = cornerRadii[1]
        let bottomLeftRadius = cornerRadii[2]
        let bottomRightRadius = cornerRadii[3]
        
        // Top-left corner
        path.move(to: CGPoint(x: 0, y: topLeftRadius))
        if topLeftRadius > 0 {
            path.addArc(withCenter: CGPoint(x: topLeftRadius, y: topLeftRadius), radius: topLeftRadius, startAngle: CGFloat.pi, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        } else {
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
        
        // Top-right corner
        path.addLine(to: CGPoint(x: width - topRightRadius, y: 0))
        if topRightRadius > 0 {
            path.addArc(withCenter: CGPoint(x: width - topRightRadius, y: topRightRadius), radius: topRightRadius, startAngle: 1.5 * CGFloat.pi, endAngle: 0, clockwise: true)
        } else {
            path.addLine(to: CGPoint(x: width, y: 0))
        }
        
        // Bottom-right corner
        path.addLine(to: CGPoint(x: width, y: height - bottomRightRadius))
        if bottomRightRadius > 0 {
            path.addArc(withCenter: CGPoint(x: width - bottomRightRadius, y: height - bottomRightRadius), radius: bottomRightRadius, startAngle: 0, endAngle: 0.5 * CGFloat.pi, clockwise: true)
        } else {
            path.addLine(to: CGPoint(x: width, y: height))
        }
        
        // Bottom-left corner
        path.addLine(to: CGPoint(x: bottomLeftRadius, y: height))
        if bottomLeftRadius > 0 {
            path.addArc(withCenter: CGPoint(x: bottomLeftRadius, y: height - bottomLeftRadius), radius: bottomLeftRadius, startAngle: 0.5 * CGFloat.pi, endAngle: CGFloat.pi, clockwise: true)
        } else {
            path.addLine(to: CGPoint(x: 0, y: height))
        }
        
        path.close()
        
        // Apply the mask layer to round the corners
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
        
        // Create a shadow layer
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = path.cgPath
        shadowLayer.fillColor = self.backgroundColor?.cgColor
        
        // Shadow
        shadowLayer.shadowOpacity = 0.3
        shadowLayer.shadowOffset = CGSize(width: 5, height: 5)
        
        // Ajouter la vue d'ombre en arrière-plan
        if let superview = self.superview {
            let shadowView = UIView(frame: self.frame)
            shadowView.layer.insertSublayer(shadowLayer, at: 0)
            superview.insertSubview(shadowView, belowSubview: self)
        }
    }
}
