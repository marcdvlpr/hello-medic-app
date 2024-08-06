//
//  FilterButtonView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 05/08/2024.
//

import SwiftUI

struct FilterButtonView: View {
    
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
        }
    }
}

#Preview {
    FilterButtonView()
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        FilterButtonView().environmentObject(DoctorListViewModel())
        
    }
    
}


