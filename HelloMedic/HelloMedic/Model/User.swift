//
//  User.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 31/07/2024.
//

import Foundation

struct User: Decodable {
    let id: String
    let email: String
    let password: String
    let verified: Bool?
    let firstName: String
    let lastName: String
    let dateOfBirth: TimeInterval
    let gender: String
    let address: String
    let postalCode: String
    let city: String
    let phone: String
    
    var formattedDate: String {
        return Date(timeIntervalSince1970: dateOfBirth).formatted(date: .long, time: .omitted)
    }
}