//
//  SearchView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 19/07/2024.
//

import SwiftUI

struct SearchView: View {
    
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
                ForEach (doctorslist.filteredDoctors) { doctor in
                    NavigationLink {
                        ProfilSpecialistView(specialist: doctor)
                    } label: {
                        HStack {
                            AsyncImage(url: URL(string: doctor.pict)) { image in
                                image
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                                    .padding()
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment: .leading) {
                                
                                Text(doctor.name)
                                    .font(.headline)
                                Text(doctor.specialty)
                                    .font(.subheadline)
                                HStack {
                                    // Afficher les étoiles en fonction de la note
                                    ForEach(0..<doctor.rating, id: \.self) { _ in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                    ForEach(0..<(5 - doctor.rating), id: \.self) { _ in
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
            .onAppear {
                doctorslist.fetchDoctors()
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
