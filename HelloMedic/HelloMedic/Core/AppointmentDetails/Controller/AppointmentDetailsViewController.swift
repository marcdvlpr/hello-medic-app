//
//  AppointmentDetailsViewController.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 07/08/2024.
//

import UIKit
import MapKit

class AppointmentDetailsViewController: UIViewController {
    
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestLocation()
        
        appointmentDetailsView.addSubview(imageView)
        appointmentDetailsView.addSubview(nameLabel)
        appointmentDetailsView.addSubview(specialityLabel)
        appointmentDetailsView.addSubview(estimatedTimeLabel)
        appointmentDetailsView.addSubview(mapView)
        appointmentDetailsView.addSubview(informationView)
        appointmentDetailsView.addSubview(nameContactLabel)
        appointmentDetailsView.addSubview(contactPhoneButton)
        
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
        map.showsUserLocation = true
        return map
    }()
    
    private let informationView: UITextView = {
        let text = UITextView()
        text.text = """
                        Préparer le nécessaire pour votre rendez-vous
                    
                    • Carte vitale
                    • Carnet de santé
                    • Les traitements en cours
                    • Informer pour toute allergie et/ou interventions 
                      récentes
                    """
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.backgroundColor = UIColor(named: "hmBlue")
        text.textColor = .white
        text.textContainerInset = UIEdgeInsets(top: 18, left: 12, bottom: 18, right: 12)
        text.clipsToBounds = true
        text.layer.cornerRadius = 10
        return text
    }()
    
    private let nameContactLabel: UILabel = {
        let text = UILabel()
        text.text = "Contacter Dr Lisa Smith"
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return text
    }()
    
    private let contactPhoneButton: UIButton = {
        let button = UIButton()
        button.setTitle("06 07 08 09 10", for: .normal)
        button.setImage(UIImage(systemName: "phone.fill"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    private func setupAutoLayout() {
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
        
        informationView.translatesAutoresizingMaskIntoConstraints = false
        informationView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        informationView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 20).isActive = true
        informationView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        informationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        informationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        
        nameContactLabel.translatesAutoresizingMaskIntoConstraints = false
        nameContactLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        nameContactLabel.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 20).isActive = true
        nameContactLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        nameContactLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        nameContactLabel.textAlignment = .left
        
        contactPhoneButton.translatesAutoresizingMaskIntoConstraints = false
        contactPhoneButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        contactPhoneButton.topAnchor.constraint(equalTo: nameContactLabel.bottomAnchor, constant: 10).isActive = true
        contactPhoneButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        contactPhoneButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        contactPhoneButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager,
              let location = locationManager.location else { return }
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
            mapView.setRegion(region, animated: true)
        case .denied:
            print("Location services has been denied.")
        case .notDetermined, .restricted:
            print("Location cannot be dertermined or restricted.")
        @unknown default:
            print("Unkkown error. Unable to get location.")
        }
    }
}

extension AppointmentDetailsViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}
