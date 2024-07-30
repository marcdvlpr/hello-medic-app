//
//  SpecialtyViewModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class SpecialityViewModel: ObservableObject {
    @Published var specialities: [Speciality] = []

    init() {
        // Chargez les données initiales ou simulez-les pour l'exemple
        self.specialities = [
            Speciality(nom: "Médecin généraliste", image: ""),
            Speciality(nom: "Pédiatre", image: ""),
            Speciality(nom: "Kinésithérapeute", image: ""),
            Speciality(nom: "Infirmière", image: "")
        ]
    }
}
