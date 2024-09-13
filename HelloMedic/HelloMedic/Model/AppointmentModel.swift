//
//  AppointmentModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import Foundation

struct Appointment : Codable, Identifiable {
    var id : UUID
    var place : String
    var document : Document
    var dateHeureRdv : String
    var motif : String
    var isCanceled : Bool
    var specialistId : String
}

struct Document : Codable {
    var nom : String
    var namePicto : String
}
