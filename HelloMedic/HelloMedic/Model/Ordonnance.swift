//
//  RegisterM.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 01/08/2024.
//

import Foundation
import SwiftUI

class Ordonnance: ObservableObject{
    @Published var id = id
    @Published var symbolimage: String
    @Published var titre: String
    @Published var docname: String
    @Published var date: String
    @Published var symboluser: String
    @Published var username: String
    
    init(titre: String, docname: String, date: String, username: String) {
        self.id = ""
        self.titre = titre
        self.symbolimage = ""
        self.docname = docname
        self.date = date
        self.symboluser = ""
        self.username = username
    }
    }
    
var array = [Ordonnance(titre: "Ordonnance de médicaments", docname: "Dr KEPNER", date: "26 Juillet 2024", username: "John DOE"),
    Ordonnance(titre: "Ordonnance de médicaments", docname: "Dr BAILEY", date: "23 Mai 2024", username: "John DOE"),
    Ordonnance(titre: "Ordonnance de médicaments", docname: "Dr CAGE", date: "04 Janvier 2024", username: "John DOE")]
