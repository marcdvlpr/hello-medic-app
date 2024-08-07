//
//  EditProfileViewModel.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 06/08/2024.
//

import Foundation

class EditProfileViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var dateOfBirth: String = ""
    @Published var gender: String = ""
    @Published var address: String = ""
    @Published var postalCode: String = ""
    @Published var city: String = ""
    @Published var phone: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var bloodType: String = ""
    @Published var allergies: String = ""
    @Published var height: String = "0"
    @Published var weight: String = "0"
    @Published var wheelchair: String = ""
    
    private let user: User = JSONLoader.load("usersData.json")
    private let medicalInfo: MedicalInfo = JSONLoader.load("medicalInfoData.json")
    
    init() {
        firstName = user.firstName
        lastName = user.lastName
        dateOfBirth = user.formattedDate
        gender = user.gender
        address = user.address
        postalCode = user.postalCode
        city = user.city
        phone = user.phone
        email = user.email
        password = user.password
        bloodType = medicalInfo.bloodType
        allergies = medicalInfo.allergies ?? ""
        height = String(medicalInfo.height)
        weight = String(medicalInfo.weight)
        wheelchair = medicalInfo.wheelchair ? "Oui" : "Non"
    }
    
    func initials() -> String {
        return user.initials
    }
}
