//
//  User.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 31/07/2024.
//

import Foundation

struct User {
    let id = UUID()
    let email: String
    let password: String
    let verified: Bool?
    let firstName: String
    let lastName: String
    let dateOfBirth: Date
    let gender: Gender
    let address: String
    let postalCode: String
    let city: String
    let phone: String
    
    enum Gender: String {
        case male
        case female
        case other
    }
}
