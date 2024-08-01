//
//  DoctorListModel.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 01/08/2024.
//

import Foundation
import SwiftUI

class DoctorListViewModel: ObservableObject {
    
    @Published var doctors = [
        Doctor(pictName: "drlisa", name: "Dr. Lisa MANOBAL", specialty: "Médecin généraliste", rating: 5),
        Doctor(pictName: "drnicolas", name: "Dr. Nicolas CAGE", specialty: "Pédiatre", rating: 4),
        Doctor(pictName: "drmiranda", name: "Dr. Miranda Bailey", specialty: "Kinésithérapeute", rating: 4),
        Doctor(pictName: "drapril", name: "Dr. April Kepner", specialty: "Infirmière", rating: 4),
        Doctor(pictName: "drmeredith", name: "Dr. Méredith Grey", specialty: "Médecin généraliste", rating: 5)
    ]
    
    @Published var searchText: String = ""
    
    var filteredDoctors: [Doctor] {
        if searchText.isEmpty {
            return doctors
        } else {
            return doctors.filter { $0.name.contains(searchText) || $0.specialty.contains(searchText) }
        }
    }
}
