//
//  UserProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 19/07/2024.
//

import SwiftUI

//enum RoutePath: Hashable {
//    switch route {
//    case login: return LoginView()
//    }
//}

struct UserProfileView: View {
    
    @StateObject var viewModel = UserProfileViewModel()
    @State var isSheetPresented = false
    
    let userId = "761f596e-d330-4960-b839-c68d614915e4"
    
    var body: some View {
        NavigationStack {
            LoadingImageView(url: URL(string: viewModel.user.picture),
                             initials: viewModel.user.initials)
            .shadow(radius: 10)
            
            Button {
                isSheetPresented.toggle()
            } label: {
                Text("Editer")
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(.hmBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .sheet(isPresented: $isSheetPresented){
                EditProfileView(viewModel: viewModel, 
                                user: viewModel.user,
                                medicalInfo: viewModel.medicalInfo)
            }
            .shadow(radius: 10)
            
            List {
                NavigationLink {
                    MyPrescriptionView()
                } label: {
                    Text("Documents")
                }
                
                Section("Information Personnelle ") {
                    RowProfileView(title: "Prénom", 
                                   value: viewModel.user.firstName)
                    RowProfileView(title: "Nom",
                                   value: viewModel.user.lastName)
                    RowProfileView(title: "Date de naissance",
                                   value: viewModel.user.dateOfBirth.formatted(date: .abbreviated, time: .omitted))
                    RowProfileView(title: "Genre",
                                   value: viewModel.user.gender.capitalized)
                    RowProfileView(title: "Adresse",
                                   value: viewModel.user.address)
                    RowProfileView(title: "Code Postal",
                                   value: viewModel.user.postalCode)
                    RowProfileView(title: "Ville",
                                   value: viewModel.user.city)
                    RowProfileView(title: "Téléphone",
                                   value: viewModel.user.phone)
                }
                
                Section("Information Médical") {
                    RowProfileView(title: "Groupe Sanguin", 
                                   value: viewModel.medicalInfo.bloodType)
                    RowProfileView(title: "Allergies",
                                   value: viewModel.medicalInfo.allergies)
                    RowProfileView(title: "Taille",
                                   value: "\(viewModel.medicalInfo.height) cm")
                    RowProfileView(title: "Poids",
                                   value: "\(viewModel.medicalInfo.weight) kg")
                    RowProfileView(title: "Fauteuil Roulant",
                                   value: "\(viewModel.medicalInfo.wheelchair ? "Oui" : "Non")")
                }
                
                Section("Connexion") {
                    RowProfileView(title: "Email", 
                                   value: viewModel.user.email)
                    RowProfileView(title: "Password",
                                   value: "••••••••••••")
                }
                
                Button {
                    print("LOGOUT")
                } label: {
                    Text("Déconnexion")
                        .foregroundStyle(.red)
                }
                
                NavigationLink {
                    LoginView()
                } label: {
                    Button {
                        viewModel.deleteUser(userId: "dbabb044-54f1-4790-a42f-68f11594ae32")
                    } label: {
                        Text("Supprimer son compte")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getUserById(userId: userId)
            viewModel.getMedicalInformationById(userId: userId)
        }
    }
}

#Preview {
    UserProfileView()
}
