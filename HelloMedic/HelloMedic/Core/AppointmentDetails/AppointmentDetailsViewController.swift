//
//  AppointmentDetailsViewController.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 07/08/2024.
//

import UIKit

class AppointmentDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appointmentDetailsView.addSubview(imageView)
        appointmentDetailsView.addSubview(nameLabel)
        appointmentDetailsView.addSubview(specialityLabel)
        
        view.addSubview(appointmentDetailsView)
        
        setupAutoLayout()
    }
    
    private let appointmentDetailsView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "drisabelle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let nameLabel: UILabel = {
        let text = UILabel()
        text.text = "Dr Sam Smith"
        text.textColor = UIColor(named: "hmBlue")
        text.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return text
    }()
    
    private let specialityLabel: UILabel = {
        let text = UILabel()
        text.text = "Médecin Généraliste"
        text.textColor = UIColor(named: "hmBlue")
        text.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return text
    }()
    
    func setupAutoLayout() {
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        nameLabel.textAlignment = .center
        
        specialityLabel.translatesAutoresizingMaskIntoConstraints = false
        specialityLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        specialityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        specialityLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        specialityLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        specialityLabel.textAlignment = .center
    }
}
