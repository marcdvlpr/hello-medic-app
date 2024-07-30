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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userProfileView.addSubview(imageProfile)
        
        view.addSubview(userProfileView)
        
        setupAutoLayout()
    }
    
    func setupAutoLayout() {
        imageProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        imageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageProfile.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageProfile.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageProfile.layer.cornerRadius = imageProfile.frame.width / 2
    }
}
