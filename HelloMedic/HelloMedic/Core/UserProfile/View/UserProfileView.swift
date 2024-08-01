//
//  UserProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 19/07/2024.
//

import SwiftUI

struct UserProfileView: View {
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
                    HStack {
                        Text("Prénom")
                        Spacer()
                        Text("John")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Nom")
                        Spacer()
                        Text("Doe")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Date de naissance")
                        Spacer()
                        Text("15 juillet 1998")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Genre")
                        Spacer()
                        Text("Homme")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Adresse")
                        Spacer()
                        Text("12 Avenue Montaigne")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Code Postal")
                        Spacer()
                        Text("75008")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Ville")
                        Spacer()
                        Text("Paris")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Téléphone")
                        Spacer()
                        Text("01 02 03 04 05")
                            .foregroundStyle(Color(.systemGray))
                    }
                }
                
                Section("Information Médical") {
                    HStack {
                        Text("Groupe Sanguin")
                        Spacer()
                        Text("O+")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Allergie")
                        Spacer()
                        Text("")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Taille")
                        Spacer()
                        Text("180 cm")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Poids")
                        Spacer()
                        Text("80 kg")
                            .foregroundStyle(Color(.systemGray))
                    }
                    HStack {
                        Text("Fauteuil Roulant")
                        Spacer()
                        Text("80 kg")
                            .foregroundStyle(Color(.systemGray))
                    }
                    
                }
                
                Section("Connexion") {
                    HStack {
                        Text("Email")
                        Spacer()
                        Text("johndoe@protonmail.com")
                            .tint(Color(.systemGray))
                    }
                    HStack {
                        Text("Password")
                        Spacer()
                        Text("••••••••••••")
                            .foregroundStyle(Color(.systemGray))
                    }
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
