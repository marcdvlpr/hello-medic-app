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
        Doctor(pictName: "drlisa", name: "Dr. Lisa MANOBAL", specialty: "Médecin généraliste", rating: 5, distance: "1,2 Km", availability: "se déplacer à 9h00"),
        Doctor(pictName: "drnicolas", name: "Dr. Nicolas CAGE", specialty: "Pédiatre", rating: 4, distance: "1,1 Km", availability: "se déplacer à 9h00"),
        Doctor(pictName: "drmiranda", name: "Dr. Miranda Bailey", specialty: "Kinésithérapeute", rating: 5, distance: "1 Km", availability: "se déplacer à 9h00"),
        Doctor(pictName: "drapril", name: "Dr. April Kepner", specialty: "Infirmière", rating: 5, distance: "1,4 Km", availability: "se déplacer à 9h00"),
        Doctor(pictName: "drmeredith", name: "Dr. Méredith Grey", specialty: "Médecin généraliste", rating: 4, distance: "2 Km", availability: "se déplacer à 9h00"),
        Doctor(pictName: "drlisa", name: "Dr. AS Sandy Wilder Cheng", specialty: "Aide-soignante", rating: 4, distance: "1 Km", availability: "se déplacer à 9h00")
        
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
