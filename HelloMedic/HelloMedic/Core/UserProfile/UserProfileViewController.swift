//
//  UserProfileViewController.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 29/07/2024.
//

import SwiftUI

class UserProfileViewController: UIViewController {

    private let userProfileView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let imageProfile: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "hmLogo")
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let editButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Editer"
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: 5,
            leading: 15,
            bottom: 5,
            trailing: 15
        )
        configuration.baseBackgroundColor = .hmBlue
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userProfileView.addSubview(imageProfile)
        userProfileView.addSubview(editButton)
        
        view.addSubview(userProfileView)
        
        setupAutoLayout()
    }
    
    func setupAutoLayout() {
        imageProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        imageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageProfile.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageProfile.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
        
        editButton.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 10).isActive = true
        editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
