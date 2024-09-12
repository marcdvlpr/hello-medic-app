//
//  RegisterM.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 01/08/2024.
//

import Foundation
import SwiftUI

struct Ordonnance: Codable, Identifiable {
    var id: Int
    var titre: String
    var docname: String
    var date: String
    var username: String
    
    }

