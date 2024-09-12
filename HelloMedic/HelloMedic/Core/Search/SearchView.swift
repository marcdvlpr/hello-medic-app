//
//  SearchView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 19/07/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @StateObject private var doctorslist = DoctorListViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            HStack {
                Text("Spécialiste")
                    .font(.headline)
                    .padding()
                Spacer()
            }.padding(-10)
            
            List {
                ForEach (doctorslist.filteredDoctors) { doctorslist in
                    NavigationLink {
                        ProfilSpecialistView(specialist: ProfilSpecialist(nameImage: doctorslist.pict, name: doctorslist.name, firstName: "", perimeter: doctorslist.perimeter, phoneNumber: doctorslist.phoneNumber, paymentMethod: doctorslist.paymentMethod, languages: doctorslist.paymentMethod, horaires: doctorslist.horaires, certification: Certification(school: doctorslist.certification.school, diplome: doctorslist.certification.diplome), speciality: Speciality(nom: "", image: "")))
                    } label: {
                        HStack {
                            Image(doctorslist.pict)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                .padding()
                            
                            VStack(alignment: .leading) {
                                
                                Text(doctorslist.name)
                                    .font(.headline)
                                Text(doctorslist.specialty)
                                    .font(.subheadline)
                                HStack {
                                    // Afficher les étoiles en fonction de la note
                                    ForEach(0..<doctorslist.rating, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                    ForEach(0..<(5 - doctorslist.rating), id: \.self) { _ in
                                        Image(systemName: "star")
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        // bookmark
                                    }) {
                                        Image(systemName: "bookmark")
                                            .foregroundColor(.blue)
                                    }
                                }
                                
                            }
                            
                        }
                        .shadow(radius: 2)
                        
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Recherche")
            .searchable(text: $doctorslist.searchText, prompt: "Rechercher un médecin")
        }
    }
}

#Preview {
    SearchView()
}
