//
//  DetailAppointmentViewController.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import UIKit

class DetailAppointmentViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setComposants()
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
        
        let composantMotif = ComposantView(nameSection: "Motif", imageSection: UIImage(systemName: "message.fill") ?? UIImage(), textSection: "Rappel Vaccin",topCorner: 14, bottomCorner: 14)
        let composantPlace = ComposantView(nameSection: "Lieu", imageSection: UIImage(systemName: "location.fill") ?? UIImage(), textSection: "12 rue des Peupliers\n75008",topCorner: 14, bottomCorner: 0)
        let composantPhone = ComposantView(nameSection: "Contact", imageSection: UIImage(systemName: "phone.fill") ?? UIImage(), textSection: "01 12 23 34 56",topCorner: 0, bottomCorner: 0)
        let composantPay = ComposantView(nameSection: "Modalités paiement", imageSection: UIImage(systemName: "creditcard.fill") ?? UIImage(), textSection: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée",topCorner: 0, bottomCorner: 0)
        
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
        
        composantPlace.applyRoundedCorners(cornerRadii: [14,14,0,0])
        
        self.view.addSubview(rectangle)
        self.view.addSubview(dateHStack)
        self.view.addSubview(timeHStack)
        self.view.addSubview(divider)
        self.view.addSubview(specialistHStack)
        self.view.addSubview(composantMotif)
        self.view.addSubview(composantPlace)
        self.view.addSubview(composantPhone)
        self.view.addSubview(composantPay)
        
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
        
        NSLayoutConstraint.activate([
            rectangle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 7),
            rectangle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -7),
            rectangle.widthAnchor.constraint(equalToConstant: 379),
            rectangle.heightAnchor.constraint(equalToConstant: 587)
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
    }
}

class ComposantView: UIView {
    
    var nameSection : String
    var imageSection : UIImage
    var textSection : String
    var topCorner : CGFloat
    var bottomCorner : CGFloat
    
    init(nameSection: String, imageSection: UIImage, textSection: String,topCorner: CGFloat, bottomCorner: CGFloat) {
        self.nameSection = nameSection
        self.imageSection = imageSection
        self.textSection = textSection
        self.topCorner = topCorner
        self.bottomCorner = bottomCorner
        super.init(frame: .zero)
        setupView()
    }
    
        
    required init?(coder: NSCoder) {
        self.nameSection = ""
        self.imageSection = UIImage()
        self.textSection = ""
        self.topCorner = 0
        self.bottomCorner = 0
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
        
//        self.layer.cornerRadius = 14
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
    
    override func layoutSubviews() {
            super.layoutSubviews()
            // Appliquer le masque personnalisé pour les coins arrondis après la mise en page
        applyRoundedCorners(cornerRadii: [topCorner, topCorner, bottomCorner, bottomCorner])
        }
    
    public func applyRoundedCorners(cornerRadii: [CGFloat]) {
            let path = UIBezierPath()
            let width = self.bounds.width
            let height = self.bounds.height
            
            let topLeftRadius = cornerRadii[0]
            let topRightRadius = cornerRadii[1]
            let bottomLeftRadius = cornerRadii[2]
            let bottomRightRadius = cornerRadii[3]
            
            // Move to top-left corner
            path.move(to: CGPoint(x: 0, y: topLeftRadius))
            
            // Top-left corner
            if topLeftRadius > 0 {
                path.addArc(withCenter: CGPoint(x: topLeftRadius, y: topLeftRadius), radius: topLeftRadius, startAngle: CGFloat.pi, endAngle: 1.5 * CGFloat.pi, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: topLeftRadius, y: 0))
            }
            
            // Top-right corner
            if topRightRadius > 0 {
                path.addLine(to: CGPoint(x: width - topRightRadius, y: 0))
                path.addArc(withCenter: CGPoint(x: width - topRightRadius, y: topRightRadius), radius: topRightRadius, startAngle: 1.5 * CGFloat.pi, endAngle: 0, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: width, y: 0))
                path.addLine(to: CGPoint(x: width, y: topRightRadius))
            }
            
            // Bottom-right corner
            if bottomRightRadius > 0 {
                path.addLine(to: CGPoint(x: width, y: height - bottomRightRadius))
                path.addArc(withCenter: CGPoint(x: width - bottomRightRadius, y: height - bottomRightRadius), radius: bottomRightRadius, startAngle: 0, endAngle: 0.5 * CGFloat.pi, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: width, y: height))
                path.addLine(to: CGPoint(x: width - bottomRightRadius, y: height))
            }
            
            // Bottom-left corner
            if bottomLeftRadius > 0 {
                path.addLine(to: CGPoint(x: bottomLeftRadius, y: height))
                path.addArc(withCenter: CGPoint(x: bottomLeftRadius, y: height - bottomLeftRadius), radius: bottomLeftRadius, startAngle: 0.5 * CGFloat.pi, endAngle: CGFloat.pi, clockwise: true)
            } else {
                path.addLine(to: CGPoint(x: 0, y: height))
                path.addLine(to: CGPoint(x: 0, y: height - bottomLeftRadius))
            }
            
            path.close()
            
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
}
