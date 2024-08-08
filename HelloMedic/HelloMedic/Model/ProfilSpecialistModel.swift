//
//  ProfilSpecialistModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class ProfilSpecialist : Identifiable {
    var id = UUID()
    var nameImage: String
    var name : String
    var firstName : String
    var perimeter : String
    var phoneNumber: String
    var paymentMethod: String
    var languages: String
    var horaires: String
    var certification : Certification
    var speciality: Speciality
    
    init(id: UUID = UUID(), nameImage: String, name: String, firstName: String, perimeter: String, phoneNumber: String, paymentMethod: String, languages: String, horaires: String,certification: Certification, speciality: Speciality) {
        self.id = id
        self.nameImage = nameImage
        self.name = name
        self.firstName = firstName
        self.perimeter = perimeter
        self.phoneNumber = phoneNumber
        self.paymentMethod = paymentMethod
        self.languages = languages
        self.horaires = horaires
        self.certification = certification
        self.speciality = speciality
    }
}

class Certification {
    var id = UUID()
    var school: String
    var diplome: String
    
    init(id: UUID = UUID(), school: String, diplome: String) {
        self.id = id
        self.school = school
        self.diplome = diplome
    }
}
