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
                        Text(doctorslist.name)
                    } label: {
                        HStack {
                            Image(doctorslist.pictName)
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
                                    ForEach(Array(repeating: 0, count: doctorslist.rating), id: \.self) { i in
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                    ForEach(Array(repeating: 0, count: 5 - doctorslist.rating), id: \.self) { i in
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
