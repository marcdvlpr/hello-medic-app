//
//  User.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 31/07/2024.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let password: String
    let verified: Bool?
    var firstName: String
    let lastName: String
    let dateOfBirth: Date
    let gender: String
    let address: String
    let postalCode: String
    let city: String
    let phone: String
    let picture: String
    
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        
        if let components = formatter.personNameComponents(from: "\(firstName) \(lastName)") {
            formatter.style = .abbreviated
            
            return formatter.string(from: components)
        }
        return ""
    }
}

extension User {
    static let user = User(id: "761f596e-d330-4960-b839-c68d614915e4",
                                email: "johndoe@protonmail.com",
                                password: "",
                                verified: false,
                                firstName: "John",
                                lastName: "Doe",
                                dateOfBirth: Date(timeIntervalSinceNow: -32177760),
                                gender: "homme",
                                address: "10 Rue Montaigne",
                                postalCode: "75001",
                                city: "Paris",
                                phone: "0607080910",
                                picture: "https://i.pravatar.cc/300?img=12")
}
