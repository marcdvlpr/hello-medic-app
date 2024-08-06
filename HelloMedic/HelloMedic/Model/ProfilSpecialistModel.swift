//
//  ProfilSpecialistModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class ProfilSpecialist : Identifiable {
    var id = UUID()
    var picture: String
    var name : String
    var firstName : String
    var adress: String
    var phoneNumber: String
    var paymentMethod: String
    var languages: String
    var horaires: String
    var speciality: Speciality
    
    init(id: UUID = UUID(), picture: String, name: String, firstName: String, adress: String, phoneNumber: String, paymentMethod: String, languages: String, horaires: String, speciality: Speciality) {
        self.id = id
        self.picture = picture
        self.name = name
        self.firstName = firstName
        self.adress = adress
        self.phoneNumber = phoneNumber
        self.paymentMethod = paymentMethod
        self.languages = languages
        self.horaires = horaires
        self.speciality = speciality
    }
}
