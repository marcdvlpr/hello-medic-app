//
//  AppointmentModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class Appointment : Identifiable{
    var id = UUID()
    var place : String
    var document : Document
    var dateHeureRdv : Date
    var isAccepted : Bool
    var motif : String
    @Published var isCanceled : Bool
    var specialist : ProfilSpecialist
    
    init(id: UUID = UUID(), place: String, document: Document, dateHeureRdv: Date, isAccepted: Bool, motif: String, isCanceled: Bool = false, specialist: ProfilSpecialist) {
        self.id = id
        self.place = place
        self.document = document
        self.dateHeureRdv = dateHeureRdv
        self.isAccepted = isAccepted
        self.motif = motif
        self.isCanceled = isCanceled
        self.specialist = specialist
    }
}

class Document {
    var id = UUID()
    var nom : String
    var namePicto : String
    
    init(id: UUID = UUID(), nom: String, namePicto: String) {
        self.id = id
        self.nom = nom
        self.namePicto = namePicto
    }
}
