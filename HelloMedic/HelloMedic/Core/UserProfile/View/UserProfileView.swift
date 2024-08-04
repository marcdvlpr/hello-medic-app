//
//  UserProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 19/07/2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject var vm = UserProfileViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color(.systemGray2))
                Text("JD")
                    .font(.largeTitle)
            }
            
            Button {
                print("EDITER")
            } label: {
                Text("Editer")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            
            List {
                Section("Information Personnelle ") {
                    RowProfileView(title: "Prénom", 
                                   value: vm.user.firstName)
                    RowProfileView(title: "Nom",
                                   value: vm.user.lastName)
                    RowProfileView(title: "Date de naissance",
                                   value: vm.user.formattedDate)
                    RowProfileView(title: "Genre", 
                                   value: vm.user.gender)
                    RowProfileView(title: "Adresse", 
                                   value: vm.user.address)
                    RowProfileView(title: "Code Postal", 
                                   value: vm.user.postalCode)
                    RowProfileView(title: "Ville", 
                                   value: vm.user.city)
                    RowProfileView(title: "Téléphone", 
                                   value: vm.user.phone)
                }
                
                Section("Information Médical") {
                    RowProfileView(title: "Groupe Sanguin", 
                                   value: vm.medicalInfo.bloodType)
                    RowProfileView(title: "Allergies", 
                                   value: vm.medicalInfo.allergies)
                    RowProfileView(title: "Taille", 
                                   value: "\(vm.medicalInfo.height) cm")
                    RowProfileView(title: "Poids", 
                                   value: "\(vm.medicalInfo.weight) kg")
                    RowProfileView(title: "Fauteuil Roulant", 
                                   value: "\(vm.medicalInfo.wheelchair ? "Oui" : "Non")")
                }
                
                Section("Connexion") {
                    RowProfileView(title: "Email", 
                                   value: vm.user.email)
                    RowProfileView(title: "Password", 
                                   value: "••••••••••••")
                }
                
                Button {
                    print("LOGOUT")
                } label: {
                    Text("Déconnexion")
                        .foregroundStyle(.red)
                }
                Button {
                    print("DELETE")
                } label: {
                    Text("Supprimer son compte")
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

#Preview {
    UserProfileView()
}
