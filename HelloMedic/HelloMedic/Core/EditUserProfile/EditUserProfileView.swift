//
//  EditProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 05/08/2024.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var dateOfBirth: String = ""
    @State private var gender: String = ""
    @State private var address: String = ""
    @State private var postalCode: String = ""
    @State private var city: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    
    var body: some View {
        VStack {
            List {
                Section("Information Personnelle ") {
                    RowEditProfileView(title: "Prénom",
                                       text: $firstName)
                    RowEditProfileView(title: "Nom",
                                       text: $lastName)
                    RowEditProfileView(title: "Date de Naissance",
                                       text: $dateOfBirth)
                    RowEditProfileView(title: "Genre",
                                       text: $gender)
                    RowEditProfileView(title: "Adresse",
                                       text: $address)
                    RowEditProfileView(title: "Code Postal",
                                       text: $postalCode)
                    RowEditProfileView(title: "Ville",
                                       text: $city)
                    RowEditProfileView(title: "Téléphone",
                                       text: $phone)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
