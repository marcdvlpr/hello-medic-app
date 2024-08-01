//
//  AppointmentModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

class Appointment : Identifiable{
    var id = UUID()
    var dateHeureRdv : Date
    var isAccepted : Bool
    var motif : String
    var isCanceled : Bool
    var specialist : ProfilSpecialist
    
    init(id: UUID = UUID(), dateHeureRdv: Date, isAccepted: Bool, motif: String, isCanceled: Bool, specialist: ProfilSpecialist) {
        self.id = id
        self.dateHeureRdv = dateHeureRdv
        self.isAccepted = isAccepted
        self.motif = motif
        self.isCanceled = isCanceled
        self.specialist = specialist
    }
}
