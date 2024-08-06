//
//  FilterButtonView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 05/08/2024.
//

import SwiftUI

/// Une vue qui affiche une liste de médecins filtrés par spécialité.
struct FilterButtonView: View {
    /// Le modèle de vue des médecins, fourni par l'environnement.
    @EnvironmentObject var doctorslist : DoctorListViewModel
    
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(doctorslist.filtredSpecialty) { doctorslist in
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
        }
    }
}

#Preview {
    FilterButtonView().environmentObject(DoctorListViewModel())
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ContentView().environmentObject(DoctorListViewModel())
        
    }
    
}


