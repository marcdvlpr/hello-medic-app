//
//  MedicalInfo.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 02/08/2024.
//

import Foundation

struct MedicalInfo: Decodable {
    let id: String
    let userID: String
    let bloodType: String
    let allergies: String?
    let height: Int
    let weight: Double
    let wheelchair: Bool
}

extension MedicalInfo {
    static let MOCK_MEDICALINFO = MedicalInfo(id: "56922dea-d62b-4dba-b974-5c59443744ed",
                                              userID: "761f596e-d330-4960-b839-c68d614915e4",
                                              bloodType: "O+",
                                              allergies: "",
                                              height: 175,
                                              weight: 75,
                                              wheelchair: false)
}
