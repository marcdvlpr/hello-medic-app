//
//  TimeSlot.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 25/08/2024.
//

import Foundation

struct TimeSlot: Identifiable {
   let id = UUID()
   let time: String
   let isAvailable: Bool
}
