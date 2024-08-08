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
        image.image = UIImage(named: "hmLogo")
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupAutoLayout() {
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
}
