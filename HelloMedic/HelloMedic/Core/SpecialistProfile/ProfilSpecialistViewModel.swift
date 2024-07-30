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
            ProfilSpecialist(picture: "drlisa", name: "Lisa", firstName: "Manobal", adress: "", phoneNumber: "0654573645", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[0]),
            ProfilSpecialist(picture: "drnicolas", name: "Nicolas", firstName: "Cage", adress: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[1]),
            ProfilSpecialist(picture: "drmiranda", name: "Miranda", firstName: "Bailey", adress: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[2]),
            ProfilSpecialist(picture: "drapril", name: "April", firstName: "Kepner", adress: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[3]),
            ProfilSpecialist(picture: "drmeredith", name: "Mérédith", firstName: "Grey", adress: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[0]),
            ProfilSpecialist(picture: "drfrancois", name: "François", firstName: "Benhamou", adress: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[0]),
            ProfilSpecialist(picture: "dralexandre", name: "Alexandre", firstName: "Dumas", adress: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[0]),
            ProfilSpecialist(picture: "drisabelle", name: "Isabelle", firstName: "Tousaint", adress: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", speciality: viewModel.specialities[3])
        ]
    }
}
