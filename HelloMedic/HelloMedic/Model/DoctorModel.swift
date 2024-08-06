//
//  DoctorModel.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import Foundation

class Doctor: Identifiable {
    let id = UUID() // Identifiant unique pour chaque docteur
    var pictName: String // Nom de l'image du docteur
    var name: String // Nom du docteur
    var specialty: String // Spécialité du docteur
    var rating: Int // Évaluation du docteur
    var distance: String
    var availability: String
    
    // Initialisateur pour la classe Doctor
    init(pictName: String, name: String, specialty: String, rating: Int, distance: String, availability: String) {
        self.pictName = pictName
        self.name = name
        self.specialty = specialty
        self.rating = rating
        self.distance = distance
        self.availability = availability
    }
}
