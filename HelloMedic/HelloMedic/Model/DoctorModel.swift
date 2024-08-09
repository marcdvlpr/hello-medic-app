//
//  DoctorModel.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import Foundation

/// Représente un médecin avec ses détails.
class Doctor: Identifiable {
    let id = UUID() /// Identifiant unique pour chaque docteur.
    var pictName: String /// Nom de l'image du docteur.
    var name: String /// Nom du docteur.
    var specialty: String /// Spécialité du docteur.
    var rating: Int /// Évaluation du docteur.
    var distance: String /// Distance jusqu'au docteur.
    var availability: String
    var perimeter : String
    var phoneNumber: String
    var paymentMethod: String
    var languages: String
    var horaires: String
    var certification : Certification
    
    /// Initialisateur pour la classe Doctor.
       ///
       /// - Parameters:
       ///   - pictName: Nom de l'image du docteur.
       ///   - name: Nom du docteur.
       ///   - specialty: Spécialité du docteur.
       ///   - rating: Évaluation du docteur.
       ///   - distance: Distance jusqu'au docteur.
       ///   - availability: Disponibilité du docteur.
    init(pictName: String, name: String, specialty: String, rating: Int, distance: String, availability: String, perimeter: String, phoneNumber: String, paymentMethod: String, languages: String, horaires: String, certification: Certification) {
        self.pictName = pictName
        self.name = name
        self.specialty = specialty
        self.rating = rating
        self.distance = distance
        self.availability = availability
        self.perimeter = perimeter
        self.phoneNumber = phoneNumber
        self.paymentMethod = paymentMethod
        self.languages = languages
        self.horaires = horaires
        self.certification = certification
    }
    
    
}
