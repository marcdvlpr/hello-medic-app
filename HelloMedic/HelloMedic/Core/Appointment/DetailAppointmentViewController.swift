//
//  DetailAppointmentViewController.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import UIKit
import SwiftUI

class DetailAppointmentViewController : UIViewController {
    var isPast : Bool
    let appointment : Appointment
    let dateRdv : String
    let heureRdv : String
    
    var profilSpecialistViewModel = ProfilSpecialistViewModel()
    
    var composantMotif : ComposantView!
    var composantPlace : ComposantView!
    var composantPhone : ComposantView!
    var composantPay : ComposantView!
    var composantDocument : ComposantView!
    
    let profilSpecialistButton = UIButton(type: .system)
    
    init(isPast: Bool, appointment : Appointment, dateRdv : String, heureRdv : String) {
        
        self.isPast = isPast
        self.appointment = appointment
        self.dateRdv = dateRdv
        self.heureRdv = heureRdv
        super.init(nibName: nil, bundle: nil)
        
        composantMotif = ComposantView(nameSection: "Motif", imageSection: UIImage(systemName: "message.fill") ?? UIImage(), textSection: appointment.motif, isPast: isPast)
        composantPlace = ComposantView(nameSection: "Lieu", imageSection: UIImage(systemName: "location.fill") ?? UIImage(), textSection: appointment.place, isPast: isPast)
        composantPhone = ComposantView(nameSection: "Contact", imageSection: UIImage(systemName: "phone.fill") ?? UIImage(), textSection: profilSpecialistViewModel.getDoctorById(appointment.specialistId).phoneNumber, isPast: isPast)
        composantPay = ComposantView(nameSection: "Modalités paiement", imageSection: UIImage(systemName: "creditcard.fill") ?? UIImage(), textSection: profilSpecialistViewModel.getDoctorById(appointment.specialistId).paymentMethod, isPast: isPast)
        composantDocument = ComposantView(nameSection: "Documents", imageSection: UIImage(systemName: "doc.fill") ?? UIImage(), textSection: appointment.document.nom, isPast: isPast, appointment: appointment, dateRdv: dateRdv)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        let scrollView = UIScrollView()
        let contentView = UIView()
        
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
        let retakeappointmentButton = UIButton()
        var configurationretakeappointmentButton = UIButton.Configuration.filled()
        
        rectangle.backgroundColor = isPast ? UIColor(named: "hmSkyBlue") : UIColor(named: "hmBlue")
        rectangle.layer.cornerRadius = 14
        
        calendarImageView.image = UIImage(systemName: "calendar")
        calendarImageView.tintColor = .white
        
        dateLabel.text = dateRdv
        dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dateLabel.textColor = .white
        
        dateHStack.axis = .horizontal
        dateHStack.spacing = 3
        dateHStack.alignment = .center
        
        timerImageView.image = UIImage(systemName: "timer")
        timerImageView.tintColor = .white
        
        timeLabel.text = heureRdv
        timeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        timeLabel.textColor = .white
        
        timeHStack.axis = .horizontal
        timeHStack.spacing = 3
        timeHStack.alignment = .center
        
        divider.backgroundColor = .white
        
        specialistNameLabel.text = "Dr \(profilSpecialistViewModel.getDoctorById(appointment.specialistId).name)"
        specialistNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        specialistNameLabel.textColor = .white
        
        specialistSpeciality.text = profilSpecialistViewModel.getDoctorById(appointment.specialistId).specialty
        specialistSpeciality.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        specialistSpeciality.textColor = .white
        
        specialistVStack.axis = .vertical
        specialistVStack.spacing = 1
        specialistVStack.alignment = .leading
        
        specialistImageView.image = UIImage(named: profilSpecialistViewModel.getDoctorById(appointment.specialistId).pict)
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
        
        configurationretakeappointmentButton.attributedTitle = AttributedString("Reprogrammer un rendez-vous", attributes: AttributeContainer([.font: titleFont]))
        
        // Modifier la taille de l'image
        configurationretakeappointmentButton.preferredSymbolConfigurationForImage = imageConfig
         
        configurationretakeappointmentButton.image = UIImage(systemName: "goforward")
        configurationretakeappointmentButton.imagePadding = 5  // Espace entre l'image et le texte
        configurationretakeappointmentButton.imagePlacement = .leading  // Image à gauche du texte
        configurationretakeappointmentButton.baseBackgroundColor = .white
        configurationretakeappointmentButton.baseForegroundColor = .hmBlue
         
        retakeappointmentButton.configuration = configurationretakeappointmentButton
        retakeappointmentButton.layer.cornerRadius = 14
        retakeappointmentButton.clipsToBounds = true
         
        
        // Ajouter la scrollView et le contentView
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(rectangle)
        contentView.addSubview(dateHStack)
        contentView.addSubview(timeHStack)
        contentView.addSubview(divider)
        contentView.addSubview(specialistHStack)
        contentView.addSubview(composantMotif)
        contentView.addSubview(composantPlace)
        contentView.addSubview(composantPhone)
        contentView.addSubview(composantPay)
        contentView.addSubview(profilSpecialistButton)
        contentView.addSubview(profilSpecialistHStack)
        if !isPast {
            contentView.addSubview(buttonsHStack)
        } else {
            contentView.addSubview(retakeappointmentButton)
            contentView.addSubview(composantDocument)
        }
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
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
        retakeappointmentButton.translatesAutoresizingMaskIntoConstraints = false
        composantDocument.translatesAutoresizingMaskIntoConstraints = false
        
        // Constrain scrollView to the edges of the view
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // Constrain contentView to the edges of the scrollView
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // Ensure contentView is the same width as scrollView
        ])
        
        // Constraints for your subviews inside contentView
        NSLayoutConstraint.activate([
            rectangle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 7),
            rectangle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -7),
            rectangle.widthAnchor.constraint(equalToConstant: 379),
            rectangle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            isPast ? rectangle.bottomAnchor.constraint(equalTo: retakeappointmentButton.bottomAnchor, constant: 16) : rectangle.bottomAnchor.constraint(equalTo: buttonsHStack.bottomAnchor, constant: 16),
            
            dateHStack.topAnchor.constraint(equalTo: rectangle.topAnchor, constant: 10),
            dateHStack.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            
            timeHStack.topAnchor.constraint(equalTo: rectangle.topAnchor, constant: 10),
            timeHStack.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            
            divider.topAnchor.constraint(equalTo: dateHStack.bottomAnchor, constant: 10),
            divider.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            divider.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            specialistImageView.widthAnchor.constraint(equalToConstant: 76),
            specialistImageView.heightAnchor.constraint(equalToConstant: 76),
            specialistHStack.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 25),
            specialistHStack.centerXAnchor.constraint(equalTo: rectangle.centerXAnchor),
            
            composantMotif.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            composantMotif.topAnchor.constraint(equalTo: specialistHStack.bottomAnchor, constant: 25),
            composantMotif.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantMotif.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            
            composantPlace.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            composantPlace.topAnchor.constraint(equalTo: composantMotif.bottomAnchor, constant: 10),
            composantPlace.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantPlace.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            
            composantPhone.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            composantPhone.topAnchor.constraint(equalTo: composantPlace.bottomAnchor, constant: 2),
            composantPhone.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantPhone.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            
            composantPay.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            composantPay.topAnchor.constraint(equalTo: composantPhone.bottomAnchor, constant: 2),
            composantPay.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantPay.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            
            profilSpecialistButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            isPast ? profilSpecialistButton.topAnchor.constraint(equalTo: composantDocument.bottomAnchor, constant: 2) : profilSpecialistButton.topAnchor.constraint(equalTo: composantPay.bottomAnchor, constant: 2),
            profilSpecialistButton.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            profilSpecialistButton.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            profilSpecialistButton.heightAnchor.constraint(equalToConstant: 45),
            
            profilSpecialistHStack.centerXAnchor.constraint(equalTo: profilSpecialistButton.centerXAnchor),
            profilSpecialistHStack.centerYAnchor.constraint(equalTo: profilSpecialistButton.centerYAnchor),
            
        ])
        
        if !isPast {
            NSLayoutConstraint.activate([
                buttonsHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                buttonsHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                buttonsHStack.topAnchor.constraint(equalTo: profilSpecialistButton.bottomAnchor, constant: 20),
                buttonsHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            ])
        } else {
            NSLayoutConstraint.activate([
                retakeappointmentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                retakeappointmentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                retakeappointmentButton.topAnchor.constraint(equalTo: profilSpecialistButton.bottomAnchor, constant: 20),
                retakeappointmentButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                composantDocument.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                composantDocument.topAnchor.constraint(equalTo: composantPay.bottomAnchor, constant: 2),
                composantDocument.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
                composantDocument.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
            ])
        }
        
        self.view.layoutIfNeeded()
    }
    
    @objc func navigateToSpecialistProfile() {
        print("Navigate to specialist profile tapped")
        // Présenter la vue SwiftUI avec UIHostingController
        let hostingController = UIHostingController(rootView: ProfilSpecialistView(specialist: profilSpecialistViewModel.getDoctorById(appointment.specialistId)))
        // Créer un UINavigationController si vous voulez que la vue SwiftUI soit dans une pile de navigation
        let navigationController = UINavigationController(rootViewController: hostingController)
        
        // Présenter le UINavigationController
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func applyRoundedCornersToComponents() {
            // Appliquer les coins arrondis après la mise à jour des contraintes
        composantMotif.applyRoundedCorners(cornerRadii: [14,14,14,14])
        composantPlace.applyRoundedCorners(cornerRadii: [14,14,0,0])
        composantPhone.applyRoundedCorners(cornerRadii: [0,0,0,0])
        composantPay.applyRoundedCorners(cornerRadii: [0,0,0,0])
        profilSpecialistButton.applyRoundedCorners(cornerRadii: [0,0,14,14])
    }
}

class ComposantView: UIView {
    
    var nameSection : String
    var imageSection : UIImage
    var textSection : String
    var isPast : Bool
    var appointment : Appointment?
    var dateRdv : String?
    
    var profilSpecialistViewModel = DoctorListViewModel()
    
    init(nameSection: String, imageSection: UIImage, textSection: String, isPast: Bool, appointment: Appointment? = nil, dateRdv: String? = nil) {
        self.nameSection = nameSection
        self.imageSection = imageSection
        self.textSection = textSection
        self.isPast = isPast
        self.appointment = appointment
        self.dateRdv = dateRdv
        super.init(frame: .zero)
        setupView()
    }
        
    required init?(coder: NSCoder) {
        self.nameSection = ""
        self.imageSection = UIImage()
        self.textSection = ""
        self.isPast = Bool()
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
        
        let documentImageView = UIImageView()
        let doctorLabel = UILabel()
        let dateLabel = UILabel()
        let separatorLabel = UILabel()
        let downloadImageView = UIImageView()
        let infoDocumentHStack = UIStackView(arrangedSubviews: [doctorLabel, separatorLabel,dateLabel])
        let infoDocumentVStack = UIStackView(arrangedSubviews: [textComposantLabel, infoDocumentHStack])
        let documentHStack = UIStackView(arrangedSubviews: [documentImageView,infoDocumentVStack,downloadImageView])
        
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
        if nameSection == "Documents" && textSection == "" && isPast {
            textComposantLabel.text = "Aucun document"
            
            addSubview(textComposantLabel)
            
            NSLayoutConstraint.activate([
                textComposantLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 37),
                textComposantLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ])
        } else if nameSection == "Documents" && textSection != "" && isPast {
            textComposantLabel.textColor = .hmGreen
            
            infoDocumentHStack.axis = .horizontal
            infoDocumentHStack.spacing = 3
            infoDocumentHStack.alignment = .center
            
            infoDocumentVStack.axis = .vertical
            infoDocumentVStack.spacing = 3
            infoDocumentVStack.alignment = .leading
            
            documentHStack.axis = .horizontal
            documentHStack.spacing = 5
            documentHStack.alignment = .center
            
            textComposantLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
            
            documentImageView.image = UIImage(systemName: appointment?.document.namePicto ?? "")
            documentImageView.tintColor = .hmGreen
            
            doctorLabel.text = "\(profilSpecialistViewModel.getDoctorById(appointment!.specialistId).name)"
            doctorLabel.textColor = .hmGreen
            doctorLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
            
            separatorLabel.text = "|"
            separatorLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
            separatorLabel.textColor = .hmGreen
            
            dateLabel.text = dateRdv
            dateLabel.textColor = .hmGreen
            dateLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
            
            downloadImageView.image = UIImage(systemName: "square.and.arrow.down")
            downloadImageView.tintColor = .hmGreen
            
            documentHStack.translatesAutoresizingMaskIntoConstraints = false
            addSubview(documentHStack)
            
            NSLayoutConstraint.activate([
                infoDocumentVStack.trailingAnchor.constraint(equalTo: downloadImageView.leadingAnchor, constant: -40),
                documentHStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 37),
                documentHStack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ])
            
        } else {
            
            addSubview(textComposantLabel)
            
            NSLayoutConstraint.activate([
                textComposantLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 37),
                textComposantLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            ])
        }
        
        composantHStack.translatesAutoresizingMaskIntoConstraints = false
        composantLabel.translatesAutoresizingMaskIntoConstraints = false
        composantImageView.translatesAutoresizingMaskIntoConstraints = false
        textComposantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(composantHStack)
        
        NSLayoutConstraint.activate([
            composantHStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            composantHStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
        ])
        
        if nameSection == "Documents" && textSection != "" && isPast {
            NSLayoutConstraint.activate([
                self.bottomAnchor.constraint(equalTo: documentHStack.bottomAnchor, constant: 30)
            ])
        } else {
            NSLayoutConstraint.activate([
                self.bottomAnchor.constraint(equalTo: textComposantLabel.bottomAnchor, constant: 30)
            ])
        }
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
        shadowLayer.shadowOpacity = 0.1
        shadowLayer.shadowOffset = CGSize(width: 5, height: 5)
        
        // Ajouter la vue d'ombre en arrière-plan
        if let superview = self.superview {
            let shadowView = UIView(frame: self.frame)
            shadowView.layer.insertSublayer(shadowLayer, at: 0)
            superview.insertSubview(shadowView, belowSubview: self)
        }
    }
}

struct DoccumentHStack : View {
    var body: some View {
        Text("Hello")
    }
}
