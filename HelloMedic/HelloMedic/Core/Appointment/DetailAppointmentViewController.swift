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
        
        let composantMotif = ComposantView()
        
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
        
        self.view.addSubview(rectangle)
        self.view.addSubview(dateHStack)
        self.view.addSubview(timeHStack)
        self.view.addSubview(divider)
        self.view.addSubview(specialistHStack)
        self.view.addSubview(composantMotif)
        
        rectangle.translatesAutoresizingMaskIntoConstraints = false
        calendarImageView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateHStack.translatesAutoresizingMaskIntoConstraints = false
        timeHStack.translatesAutoresizingMaskIntoConstraints = false
        divider.translatesAutoresizingMaskIntoConstraints = false
        specialistHStack.translatesAutoresizingMaskIntoConstraints = false
        composantMotif.translatesAutoresizingMaskIntoConstraints = false
        
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
            composantMotif.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            composantMotif.leadingAnchor.constraint(equalTo: rectangle.leadingAnchor, constant: 30),
            composantMotif.trailingAnchor.constraint(equalTo: rectangle.trailingAnchor, constant: -30),
        ])
    }
}

class ComposantView: UIView {
    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
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
        
        self.layer.cornerRadius = 14
        
        composantLabel.text = "Motif"
        composantLabel.textColor = .hmBlue
        
        composantImageView.image = UIImage(systemName: "message.fill")
        composantImageView.tintColor = .hmBlue
        
        composantHStack.axis = .horizontal
        composantHStack.spacing = 3
        composantHStack.alignment = .center
        
        textComposantLabel.text = "Rappel Vaccin\nfsfsfsf"
        textComposantLabel.numberOfLines = 0 // Permet au label de s'ajuster sur plusieurs lignes
        textComposantLabel.lineBreakMode = .byWordWrapping
        
        composantHStack.translatesAutoresizingMaskIntoConstraints = false
        composantLabel.translatesAutoresizingMaskIntoConstraints = false
        composantImageView.translatesAutoresizingMaskIntoConstraints = false
        textComposantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(composantHStack)
        addSubview(textComposantLabel)
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 100),
            composantHStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            composantHStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            textComposantLabel.topAnchor.constraint(equalTo: composantHStack.topAnchor, constant: 16),
            textComposantLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textComposantLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -32)
            
        ])
    }
}
