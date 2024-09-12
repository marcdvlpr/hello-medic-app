//
//  RegisterViewOne.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 29/07/2024.
//

import SwiftUI
import UIKit

class RegisterViewOne: UIViewController{
    
    let enteremail = UITextField()
    let enterpassword = UITextField()
    let loginButton = UIButton(type: .system)
    let errorlabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connexionUI()
        errorlabel.isHidden = true
    }
    
    func connexionUI(){
        
        enteremail.placeholder = "E-mail"
        enteremail.borderStyle = .roundedRect
        enteremail.keyboardType = .emailAddress
        enteremail.autocapitalizationType = .none
        enteremail.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enteremail)
        
        enterpassword.placeholder = "Mot de passe"
        enteremail.borderStyle = .roundedRect
        enterpassword.isSecureTextEntry = true
        enterpassword.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterpassword)
        
        loginButton.setTitle("Se connecter", for: .normal)
        loginButton.addTarget(self, action: #selector (handleLogin), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        errorlabel.textColor = .red
        errorlabel.numberOfLines = 0
        errorlabel.textAlignment = .center
        errorlabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorlabel)
        
      
    NSLayoutConstraint.activate(
       [enteremail.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
        enteremail.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        enteremail.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                 
        enterpassword.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
        enterpassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        enterpassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                 
                 
        loginButton.topAnchor.constraint(equalTo:enterpassword.bottomAnchor, constant: 100),
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        loginButton.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 20),
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                 
                 
        errorlabel.topAnchor.constraint(equalTo: errorlabel.bottomAnchor, constant: 20),
        errorlabel.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 20),
        errorlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
                ])
            
        }
        @objc func handleLogin(){
            guard let email = enteremail.text, isValidEmail(email) else {
                showError("Veuillez entrer une adresse email valide.")
                return
            }
            guard let password = enterpassword.text, !password.isEmpty else {
                showError("Veuillez entrer votre mot de passe.")
                return
            }
            errorlabel.isHidden = true
            
            let pageView = RegisterViewTwo()
                let hostingController = UIHostingController(rootView: pageView)
                hostingController.modalPresentationStyle = .fullScreen
                present(hostingController, animated: true, completion: nil)
        }
        func isValidEmail(_ email: String) -> Bool {
            let emailEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format: "SELF MATCHES %@", emailEx)
            return emailPred.evaluate(with: email)
        }
        func showError(_ message: String) {
            errorlabel.text = message
            errorlabel.isHidden = false
        }
    }

