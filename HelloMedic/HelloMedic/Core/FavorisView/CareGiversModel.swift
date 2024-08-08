//
//  CareGiversModel.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 08/08/2024.
//

import Foundation

// Paramétrage des soignants
class CareGiver: Identifiable {
    let id = UUID()
    var pictName: String
    var name: String
    var specialty: String

    init(pictName: String, name: String, specialty: String) {
        self.pictName = pictName
        self.name = name
        self.specialty = specialty
    }
}
