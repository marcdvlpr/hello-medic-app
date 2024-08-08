//
//  AppointmentDetailsViewController.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 07/08/2024.
//

import UIKit
import MapKit

class AppointmentDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appointmentDetailsView.addSubview(imageView)
        appointmentDetailsView.addSubview(nameLabel)
        appointmentDetailsView.addSubview(specialityLabel)
        appointmentDetailsView.addSubview(estimatedTimeLabel)
        appointmentDetailsView.addSubview(mapView)
        
        view.addSubview(appointmentDetailsView)
        
        setupAutoLayout()
    }
    
    private let appointmentDetailsView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "drisabelle")
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let nameLabel: UILabel = {
        let text = UILabel()
        text.text = "Dr Lisa Smith"
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
    
    private let estimatedTimeLabel: UILabel = {
        let text = UILabel()
        text.text = "Arrivée estimée 14:30"
        text.backgroundColor = UIColor(.white)
        text.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor(named: "hmBlue")?.cgColor
        text.clipsToBounds = true
        text.layer.cornerRadius = 10
        return text
    }()
    
    private let mapView: MKMapView = {
        let map = MKMapView()
        map.clipsToBounds = true
        map.layer.cornerRadius = 10
//        map.showsUserLocation = true
        return map
    }()
    
    func setupAutoLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
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
        
        estimatedTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        estimatedTimeLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        estimatedTimeLabel.topAnchor.constraint(equalTo: specialityLabel.bottomAnchor, constant: 10).isActive = true
        estimatedTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        estimatedTimeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        estimatedTimeLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        estimatedTimeLabel.textAlignment = .center
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        mapView.topAnchor.constraint(equalTo: estimatedTimeLabel.bottomAnchor, constant: 20).isActive = true
        mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
    }
}
