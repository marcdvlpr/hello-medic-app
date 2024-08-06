//
//  SpecialtyModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class Speciality {
    var id = UUID()
    var nom: String
    var image: String
    
    init(id: UUID = UUID(), nom: String, image: String) {
        self.id = id
        self.nom = nom
        self.image = image
    }
}
