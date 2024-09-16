//
//  AppUser.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 13/09/2024.
//

import Foundation

struct AppUser: Codable, Identifiable {
   let id: String
   let email: String
   let password: String
   let verified: Bool
}
