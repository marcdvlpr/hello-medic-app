//
//  CareGiversList.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 08/08/2024.
//


import Foundation

// Data des soignants
class SpecialistsDataList: ObservableObject {

    @Published var careGivers = [
        CareGiver(pictName: "dralexandre", name: "Dr Kevin Leong", specialty: "Pédiatre"),
        CareGiver(pictName: "drmiranda", name: "Ms Juliana Mejia", specialty: "Kinésithérapeute"),
        CareGiver(pictName: "drisabelle", name: "Ms Chabot Arlette", specialty: "Infirmière"),
        CareGiver(pictName: "drmeredith", name: "Dr Sandy Wilder Cheng", specialty: "Médecin généraliste"),
        CareGiver(pictName: "drlisa", name: "Ms Stephany Jackson", specialty: "Aide-soignante")
    ]

    @Published var searchSpecialties: String = ""
    @Published var specialty: String = ""

    var filteredCareGivers: [CareGiver] {
        if searchSpecialties.isEmpty {
            return careGivers
        } else {
            return careGivers.filter { $0.name.contains(searchSpecialties) || $0.specialty.contains(searchSpecialties) }
        }
    }

    var filtredSpecialty: [CareGiver] {
        if searchSpecialties.isEmpty {
            return careGivers.filter { $0.specialty == specialty }
        } else {
            return careGivers.filter { $0.specialty == specialty && $0.name.lowercased().contains(searchSpecialties.lowercased()) }
        }
    }
}
