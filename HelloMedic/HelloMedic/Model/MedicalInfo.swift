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
