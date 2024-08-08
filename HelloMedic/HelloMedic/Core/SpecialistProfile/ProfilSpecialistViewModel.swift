//
//  ProfilSpecialistViewModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class ProfilSpecialistViewModel: ObservableObject {
    @Published var specialists: [ProfilSpecialist] = []
    var viewModel = SpecialityViewModel()
    
    init() {
        // Chargez les données initiales ou simulez-les pour l'exemple
        self.specialists = [
            ProfilSpecialist(nameImage: "drlisa", name: "Lisa", firstName: "Manobal", perimeter: "20km autour de Paris 75008", phoneNumber: "01 42 76 23 58", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nEspagnol", horaires: "30km autour de Paris 75003", certification: Certification(school: "Université de Paris", diplome: "Diplôme d'État de Docteur en Médecine"), speciality: viewModel.specialities[0]),
            ProfilSpecialist(nameImage: "drnicolas", name: "Nicolas", firstName: "Cage", perimeter: "40km autour de Paris 75018", phoneNumber: "01 83 94 67 82", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAllemand", horaires: "",certification: Certification(school: "Université de Paris", diplome: "Diplôme d'État de Docteur en Médecine"), speciality: viewModel.specialities[1]),
            ProfilSpecialist(nameImage: "drmiranda", name: "Miranda", firstName: "Bailey", perimeter: "20km autour de Paris 75009", phoneNumber: "01 43 28 91 46", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAnglais", horaires: "", certification: Certification(school: "IFMK de l'Université de Paris", diplome: "Diplôme d'État de Masseur-Kinésithérapeute"), speciality: viewModel.specialities[2]),
            ProfilSpecialist(nameImage: "drapril", name: "April", firstName: "Kepner", perimeter: "30km autour de Paris 75003", phoneNumber: "01 56 20 75 34", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nAnglais", horaires: "", certification: Certification(school: "IFSI de l'AP-HP", diplome: "Diplôme d'État d'Infirmier"), speciality: viewModel.specialities[3]),
            ProfilSpecialist(nameImage: "drmeredith", name: "Mérédith", firstName: "Grey", perimeter: "20km autour de Paris 75002", phoneNumber: "01 65 67 89 12", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nPortugais", horaires: "", certification: Certification(school: "Université de Bordeaux", diplome: "Diplôme d'État de Docteur en Médecine"), speciality: viewModel.specialities[0]),
            ProfilSpecialist(nameImage: "drfrancois", name: "François", firstName: "Benhamou", perimeter: "40km autour de Paris 75012", phoneNumber: "01 49 32 58 74", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français", horaires: "", certification: Certification(school: "Université Claude Bernard Lyon 1", diplome: "Diplôme d'État de Docteur en Médecine"), speciality: viewModel.specialities[0]),
            ProfilSpecialist(nameImage: "dralexandre", name: "Alexandre", firstName: "Dumas", perimeter: "25km autour de Paris 75020", phoneNumber: "01 27 24 19 83", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nItalien", horaires: "",certification: Certification(school: "Université de Paris", diplome: "Diplôme d'État de Docteur en Médecine"), speciality: viewModel.specialities[0]),
            ProfilSpecialist(nameImage: "drisabelle", name: "Isabelle", firstName: "Tousaint", perimeter: "40km autour de Paris 75014", phoneNumber: "01 44 73 92 65", paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée", languages: "Français\nEspagnol", horaires: "", certification: Certification(school: "IFSI de l'Université de Marseille", diplome: "Diplôme d'État d'Infirmier"), speciality: viewModel.specialities[3])
        ]
    }
}
