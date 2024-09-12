//
//  DoctorModel.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import Foundation

/// Représente les informations de certification du médecin.
///
/// `MedicalCertification` inclut des informations sur l'école où le médecin a obtenu son diplôme
/// ainsi que le type de diplôme reçu.
struct MedicalCertification: Codable {
    var school: String /// L'école où le médecin a obtenu son diplôme.
    var diplome: String /// Le type de diplôme obtenu par le médecin.
}

/// Représente un médecin avec ses détails.
struct Doctor: Identifiable, Codable {
    let id: String /// Identifiant unique pour chaque docteur.
    var pict: String /// Nom de l'image du docteur.
    var name: String /// Nom du docteur.
    var specialty: String /// Spécialité du docteur.
    var rating: Int /// Évaluation du docteur.
    var distance: String /// Distance jusqu'au docteur.
    var availability: String /// Les horaires de disponibilité du médecin.
    var perimeter : String /// Le périmètre dans lequel le médecin intervient.
    var phoneNumber: String /// Le numéro de téléphone du médecin.
    var paymentMethod: String /// Les méthodes de paiement acceptées par le médecin.
    var languages: String /// Les langues parlées par le médecin.
    var horaires: String /// Les horaires spécifiques ou supplémentaires du médecin.
    var certification : MedicalCertification /// La certification médicale du médecin.
    
}
