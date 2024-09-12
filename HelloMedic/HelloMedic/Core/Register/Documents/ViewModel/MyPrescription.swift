//
//  MyPrescription.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 12/09/2024.
//

import Foundation

class MyPrescription: ObservableObject {
    @Published var ordonnance: [Ordonnance] = []
    
    func fetchordonnance() {
       
    }
    
}
