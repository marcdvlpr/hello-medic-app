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
    let school: String /// L'école où le médecin a obtenu son diplôme.
    let diplome: String /// Le type de diplôme obtenu par le médecin.
}

/// Représente un médecin avec ses détails.
struct Doctor: Identifiable, Codable {
    let id: String /// Identifiant unique pour chaque docteur.
    let pict: String /// Nom de l'image du docteur.
    let name: String /// Nom du docteur.
    let specialty: String /// Spécialité du docteur.
    let rating: Int /// Évaluation du docteur.
    let distance: String /// Distance jusqu'au docteur.
    let availability: String /// Les horaires de disponibilité du médecin.
    let perimeter : String /// Le périmètre dans lequel le médecin intervient.
    let phoneNumber: String /// Le numéro de téléphone du médecin.
    let paymentMethod: String /// Les méthodes de paiement acceptées par le médecin.
    let languages: String /// Les langues parlées par le médecin.
    let horaires: String /// Les horaires spécifiques ou supplémentaires du médecin.
    let certification : MedicalCertification /// La certification médicale du médecin.
    
}
