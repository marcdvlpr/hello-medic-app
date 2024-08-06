//
//  UserProfileViewModel.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 01/08/2024.
//

import Foundation

class UserProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var medicalInfo: MedicalInfo
    
    init() {
        self.user = JSONLoader.load("usersData.json")
        self.medicalInfo = JSONLoader.load("medicalInfoData.json")
    }
}
