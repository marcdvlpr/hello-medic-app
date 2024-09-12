//
//  DoctorListModel.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import Foundation

/// Une classe qui gère la liste des médecins et les filtres de recherche.
class DoctorListViewModel: ObservableObject {
    
    
    
    @Published var doctors = [
        Doctor(id: "", pict: "drlisa", name: "Lisa MANOBAL", specialty: "Médecin généraliste", rating: 5, distance: "1,2 Km", availability: "se déplacer à 9h00", perimeter :"20km autour de Paris 75008", phoneNumber: "01 42 76 23 58", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nEspagnol", horaires: "30km autour de Paris 75003", certification: MedicalCertification(school: "Université de Paris", diplome: "Diplôme d'État de Docteur en Médecine")),
        
        Doctor(id: "", pict: "drnicolas", name: "Nicolas CAGE", specialty: "Pédiatre", rating: 4, distance: "1,1 Km", availability: "se déplacer à 9h00", perimeter: "40km autour de Paris 75018", phoneNumber: "01 83 94 67 82", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAllemand", horaires: "",certification: MedicalCertification(school: "Université de Paris", diplome: "Diplôme d'État de Docteur en Médecine")),
        
        Doctor(id: "", pict: "drmiranda", name: "Miranda BAILEY", specialty: "Kinésithérapeute", rating: 5, distance: "1 Km", availability: "se déplacer à 9h00",perimeter: "20km autour de Paris 75009", phoneNumber: "01 43 28 91 46", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAnglais", horaires: "", certification: MedicalCertification(school: "IFMK de l'Université de Paris", diplome: "Diplôme d'État de Masseur-Kinésithérapeute")),
        
        Doctor(id: "", pict: "drapril", name: "April KEPNERK", specialty: "Infirmière", rating: 5, distance: "1,4 Km", availability: "se déplacer à 9h00",perimeter: "30km autour de Paris 75003", phoneNumber: "01 56 20 75 34", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAnglais", horaires: "", certification: MedicalCertification(school: "IFSI de l'AP-HP", diplome: "Diplôme d'État d'Infirmier")),
        
        Doctor(id: "", pict: "drmeredith", name: "Méredith GREY", specialty: "Médecin généraliste", rating: 4, distance: "2 Km", availability: "se déplacer à 9h00",perimeter: "20km autour de Paris 75002", phoneNumber: "01 65 67 89 12", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nPortugais", horaires: "", certification: MedicalCertification(school: "Université de Bordeaux", diplome: "Diplôme d'État de Docteur en Médecine")),
        
        Doctor(id: "", pict: "drlisa", name: "AS Sandy Wilder CHENG", specialty: "Aide-soignante", rating: 4, distance: "1 Km", availability: "se déplacer à 9h00", perimeter: "40km autour de Paris 75012", phoneNumber: "01 49 32 58 74", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français", horaires: "", certification: MedicalCertification(school: "Université Claude Bernard Lyon 1", diplome: "Diplôme d'État de Docteur en Médecine"))
        
    ]
    
    @Published var searchText: String = ""
    @Published var specialty: String = ""
    
    var filteredDoctors: [Doctor] {
        if searchText.isEmpty {
            return doctors
        } else {
            return doctors.filter { $0.name.contains(searchText) || $0.specialty.contains(searchText) }
        }
    }
    
    var filtredSpecialty: [Doctor] {
            if searchText.isEmpty {
                return doctors.filter { $0.specialty == specialty }
            } else {
                return doctors.filter { $0.specialty == specialty && $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
}
