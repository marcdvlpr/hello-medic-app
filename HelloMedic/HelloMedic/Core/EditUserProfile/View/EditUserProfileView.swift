//
//  EditProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 05/08/2024.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable, Codable {
    case male
    case female
    case other
    var id: Self { self }
  
    var suggestedGender: String {
        switch self {
            case .male: return "homme"
            case .female: return "femme"
            case .other: return "autre"
        }
    }
}

struct EditProfileView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: UserProfileViewModel
    
    @State private var date = Date()
    @State private var selectedGender: Gender = .male
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var dateOfBirth: Date = Date.now
    @State private var gender: String = "homme"
    @State private var address: String = ""
    @State private var postalCode: String = ""
    @State private var city: String = ""
    @State private var phone: String = ""
    @State private var picture: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var bloodType: String = ""
    @State private var allergies: String = ""
    @State private var height: Int = 0
    @State private var weight: Double = 0
    @State private var wheelchair: Bool = false
    
    var user: User
    var medicalInfo: MedicalInfo
    
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
                    let updatedUser = User(id: user.id, 
                                           email: email,
                                           password: password,
                                           verified: user.verified,
                                           firstName: firstName,
                                           lastName: lastName,
                                           dateOfBirth: dateOfBirth,
                                           gender: selectedGender.rawValue,
                                           address: address,
                                           postalCode: postalCode,
                                           city: city,
                                           phone: phone,
                                           picture: picture)
                    
                    let updatedMedicalInfo = MedicalInfo(id: medicalInfo.id,
                                                         userID: user.id,
                                                         bloodType: bloodType,
                                                         allergies: allergies,
                                                         height: height,
                                                         weight: weight,
                                                         wheelchair: wheelchair)
                    
                    viewModel.updateUser(updatedUser)
                    dismiss()
                } label: {
                    Text("Enregistrer")
                        .padding()
                        .foregroundStyle(.hmBlue)
                        .fontWeight(.bold)
                }
            }
            
            LoadingImageView(url: URL(string: viewModel.user.picture),
                             initials: viewModel.user.initials)
            .shadow(radius: 10)
            
            List {
                Section("Information Personnelle ") {
                    RowEditProfileView(title: "Prénom",
                                       text: $firstName)
                    RowEditProfileView(title: "Nom",
                                       text: $lastName)
                    
                    HStack(spacing: 10) {
                        DatePicker(selection: $dateOfBirth, in: ...Date.now, displayedComponents: .date) {
                            Text("Select a date")
                        }
                    }
                    
                    HStack(spacing: 10) {
                        Picker("Genre", selection: $selectedGender) {
                            ForEach(Gender.allCases) { gender in
                                Text(gender.suggestedGender.capitalized)
                            }
                        }
                    }
                    
                    RowEditProfileView(title: "Adresse",
                                       text: $address)
                    RowEditProfileView(title: "Code Postal",
                                       text: $postalCode)
                    RowEditProfileView(title: "Ville",
                                       text: $city)
                    RowEditProfileView(title: "Téléphone",
                                       text: $phone)
                }
                
                Section("Information Médical") {
                    RowEditProfileView(title: "Groupe Sanguin",
                                       text: $bloodType)
                    RowEditProfileView(title: "Allergies",
                                       text: $allergies)
//                    RowEditProfileView(title: "Taille (cm)",
//                                       
//                    RowEditProfileView(title: "Poids (kg)",
//                                       text: $weight)
//                    RowEditProfileView(title: "Fauteuil Roulant",
//                                       text: $wheelchair ? "Oui" : "Non")
                }
                
                Section("Connexion") {
                    RowEditProfileView(title: "Email",
                                       text: $email)
                    RowEditProfileView(title: "Password",
                                       text: $password)
                }
            }
        }
        .onAppear {
            firstName = viewModel.user.firstName
            lastName = viewModel.user.lastName
            dateOfBirth = viewModel.user.dateOfBirth
            gender = viewModel.user.gender
            address = viewModel.user.address
            postalCode = viewModel.user.postalCode
            city = viewModel.user.city
            phone = viewModel.user.phone
            picture = viewModel.user.picture
            email = viewModel.user.email
            password = viewModel.user.password
            bloodType = viewModel.medicalInfo.bloodType
            allergies = viewModel.medicalInfo.allergies ?? ""
            height = viewModel.medicalInfo.height
            weight = viewModel.medicalInfo.weight
            wheelchair = viewModel.medicalInfo.wheelchair
        }
    }
}

#Preview {
    EditProfileView(viewModel: UserProfileViewModel(), 
                    user: User.user, 
                    medicalInfo: MedicalInfo.MOCK_MEDICALINFO)
}
