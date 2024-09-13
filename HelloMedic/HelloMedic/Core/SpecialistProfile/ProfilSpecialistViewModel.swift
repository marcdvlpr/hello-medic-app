//
//  ProfilSpecialistViewModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class ProfilSpecialistViewModel: ObservableObject {
    @Published var specialists: [Doctor] = []
    var viewModel = SpecialityViewModel()
    
    init() {
        // Chargez les données initiales ou simulez-les pour l'exemple
        self.specialists = [
            Doctor(
                    id: "2866b124-9e18-48ab-af10-587c58fc0484",
                    pict: "drfrancois",
                    name: "François BENHAMOU",
                    specialty: "Médecin généraliste",
                    rating: 5,
                    distance: "5 km",
                    availability: "Lundi au Vendredi, 9h-17h",
                    perimeter: "10 km",
                    phoneNumber: "01 23 45 67 89",
                    paymentMethod: "Carte de crédit, Espèces, Assurance",
                    languages: "Français, Anglais",
                    horaires: "Lundi au Vendredi : 9h-17h, Samedi : 9h-12h",
                    certification: MedicalCertification(
                        school: "Université de Paris",
                        diplome: "Diplôme d'État de Docteur en Médecine"
                    )
                ),
                Doctor(
                    id: "fa1373af-7272-4350-95cb-fbac3b125e35",
                    pict: "drlisa",
                    name: "Lisa MANOBAL",
                    specialty: "Médecin généraliste",
                    rating: 5,
                    distance: "1,2 Km",
                    availability: "se déplacer à 9h00",
                    perimeter: "20km autour de Paris 75008",
                    phoneNumber: "01 42 76 23 58",
                    paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée",
                    languages: "Français, Espagnol",
                    horaires: "Lundi au Vendredi : 9h-17h, Samedi : 9h-12h",
                    certification: MedicalCertification(
                        school: "Université de Paris",
                        diplome: "Diplôme d'État de Docteur en Médecine"
                    )
                ),
                Doctor(
                    id: "35d66fc6-6c80-4b5b-8548-48d9941066d9",
                    pict: "drnicolas",
                    name: "Nicolas CAGE",
                    specialty: "Pédiatre",
                    rating: 4,
                    distance: "1,1 Km",
                    availability: "se déplacer à 9h00",
                    perimeter: "40km autour de Paris 75018",
                    phoneNumber: "01 83 94 67 82",
                    paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée",
                    languages: "Français, Allemand",
                    horaires: "Lundi au Vendredi : 9h-17h, Samedi : 9h-12h",
                    certification: MedicalCertification(
                        school: "Université de Paris",
                        diplome: "Diplôme d'État de Docteur en Médecine"
                    )
                ),
                Doctor(
                    id: "b13b26e1-df4b-4db6-9b79-f689ba2c848b",
                    pict: "drmiranda",
                    name: "Miranda BAILEY",
                    specialty: "Kinésithérapeute",
                    rating: 5,
                    distance: "1 Km",
                    availability: "se déplacer à 9h00",
                    perimeter: "20km autour de Paris 75009",
                    phoneNumber: "01 43 28 91 46",
                    paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée",
                    languages: "Français, Anglais",
                    horaires: "Lundi au Vendredi : 9h-17h, Samedi : 9h-12h",
                    certification: MedicalCertification(
                        school: "IFMK de l'Université de Paris",
                        diplome: "Diplôme d'État de Masseur-Kinésithérapeute"
                    )
                ),
                Doctor(
                    id: "7fd7ac17-6d3c-4db7-8234-3019e1e4227e",
                    pict: "drapril",
                    name: "April KEPNERK",
                    specialty: "Infirmière",
                    rating: 5,
                    distance: "1,4 Km",
                    availability: "se déplacer à 9h00",
                    perimeter: "30km autour de Paris 75003",
                    phoneNumber: "01 56 20 75 34",
                    paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée",
                    languages: "Français, Anglais",
                    horaires: "Lundi au Vendredi : 9h-17h, Samedi : 9h-12h",
                    certification: MedicalCertification(
                        school: "IFSI de l'AP-HP",
                        diplome: "Diplôme d'État d'Infirmier"
                    )
                ),
                Doctor(
                    id: "edb7f25c-c64f-4909-9ed7-ede787663767",
                    pict: "drmeredith",
                    name: "Méredith GREY",
                    specialty: "Médecin généraliste",
                    rating: 4,
                    distance: "2 Km",
                    availability: "se déplacer à 9h00",
                    perimeter: "20km autour de Paris 75002",
                    phoneNumber: "01 65 67 89 12",
                    paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée",
                    languages: "Français, Portugais",
                    horaires: "Lundi au Vendredi : 9h-17h, Samedi : 9h-12h",
                    certification: MedicalCertification(
                        school: "Université de Bordeaux",
                        diplome: "Diplôme d'État de Docteur en Médecine"
                    )
                ),
                Doctor(
                    id: "d953e3d8-d4cb-4863-898a-f9f9776d7660",
                    pict: "dralexandre",
                    name: "Sandy Wilder CHENG",
                    specialty: "Aide-soignant",
                    rating: 4,
                    distance: "1 Km",
                    availability: "se déplacer à 9h00",
                    perimeter: "40km autour de Paris 75012",
                    phoneNumber: "01 49 32 58 74",
                    paymentMethod: "Chèque, espèces et cartes bancaires\n• Conventionné\n• Tiers payant : Sécurité sociale et mutuelle\n• Carte Vitale acceptée",
                    languages: "Français",
                    horaires: "Lundi au Vendredi : 9h-17h, Samedi : 9h-12h",
                    certification: MedicalCertification (
                        school: "Université Claude Bernard Lyon 1",
                        diplome: "Diplôme d'État de Docteur en Médecine"
                    )
                )
        ]
    }
    
    func getDoctorById(_ id: String) -> Doctor {
        // Créer un médecin par défaut
        let defaultDoctor = Doctor(id: "1", pict: "", name: "Inconnu", specialty: "", rating: 0, distance: "", availability: "", perimeter: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", certification: MedicalCertification(school: "", diplome: ""))
        
        // Retourner le médecin correspondant ou le médecin par défaut
        return specialists.first(where: { $0.id == id }) ?? defaultDoctor
    }
}
