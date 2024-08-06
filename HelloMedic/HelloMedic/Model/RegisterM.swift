//
//  RegisterM.swift
//  HelloMedic
//
//  Created by Apprenant 162 on 01/08/2024.
//

import Foundation
import SwiftUI

class Ordonnance: Identifiable {
    var id = UUID()
    var symbolimage = Image(systemName: "pills")
    var titre: String
    var docname: String
    var date: String
    var symboluser = Image(systemName: "person.fill")
    var username: String
    
    init(id: UUID, symbolimage: Image = Image(systemName: "pills"), titre: String, docname: String, date: String, symboluser: Image = Image(systemName: "person.fill"), username: String) {
        self.id = id
        self.symbolimage = symbolimage
        self.titre = titre
        self.docname = docname
        self.date = date
        self.symboluser = symboluser
        self.username = username
    }
    }

var array = [Ordonnance(id: UUID(), symbolimage: Image(systemName: "pills"), titre: "Ordonnance de médicaments", docname: "Dr KEPNER", date: "26 Juillet 2024", symboluser: Image(systemName: "person.fill"), username: "John DOE"),
    Ordonnance(id: UUID(), symbolimage: Image(systemName: "pills"), titre: "Ordonnance de médicaments", docname: "Dr BAILEY", date: "23 Mai 2024", symboluser: Image(systemName: "person.fill"), username: "John DOE"),
    Ordonnance(id: UUID(), symbolimage: Image(systemName: "pills"), titre: "Ordonnance de médicaments", docname: "Dr CAGE", date: "04 Janvier 2024", symboluser: Image(systemName: "person.fill"), username: "John DOE")]
