//
//  EditProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 05/08/2024.
//

import SwiftUI

struct EditProfileView: View {
    
    @StateObject var vm = EditProfileViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Text("Annuler")
                        .padding()
                        .foregroundStyle(.hmBlue)
                }
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    Text("Enregistrer")
                        .padding()
                        .foregroundStyle(.hmBlue)
                        .fontWeight(.bold)
                }
            }
            
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color(.systemGray2))
                Text(vm.initials())
                    .font(.largeTitle)
            }
            
            List {
                Section("Information Personnelle ") {
                    RowEditProfileView(title: "Prénom",
                                       text: $vm.firstName)
                    RowEditProfileView(title: "Nom",
                                       text: $vm.lastName)
                    RowEditProfileView(title: "Date de Naissance",
                                       text: $vm.dateOfBirth)
                    RowEditProfileView(title: "Genre",
                                       text: $vm.gender)
                    RowEditProfileView(title: "Adresse",
                                       text: $vm.address)
                    RowEditProfileView(title: "Code Postal",
                                       text: $vm.postalCode)
                    RowEditProfileView(title: "Ville",
                                       text: $vm.city)
                    RowEditProfileView(title: "Téléphone",
                                       text: $vm.phone)
                }
                
                Section("Information Médical") {
                    RowEditProfileView(title: "Groupe Sanguin",
                                       text: $vm.bloodType)
                    RowEditProfileView(title: "Allergies",
                                       text: $vm.allergies)
                    RowEditProfileView(title: "Taille (cm)",
                                       text: $vm.height)
                    RowEditProfileView(title: "Poids (kg)",
                                       text: $vm.weight)
                    RowEditProfileView(title: "Fauteuil Roulant",
                                       text: $vm.wheelchair)
                }
                
                Section("Connexion") {
                    RowEditProfileView(title: "Email",
                                       text: $vm.email)
                    RowEditProfileView(title: "Password",
                                       text: $vm.password)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
