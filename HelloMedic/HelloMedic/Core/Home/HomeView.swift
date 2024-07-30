//
//  HomeView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 19/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isSearchViewActive = false
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Bonjour, Lisa")
                    .foregroundColor(.blue)
                    .font(.title2)
                    .padding(.top, 10)
                
                HStack {
                    
                    Button(action: {
                        
                        isSearchViewActive = true
                        
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                        
                        Text("Rechercher un medecin")
                            .foregroundStyle(.gray)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle(radius: 20))
                    .tint(.white)
                    .frame(maxWidth: 600, maxHeight: 20, alignment: .center)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 0.5)
                    
                        .navigationDestination(isPresented: $isSearchViewActive) {
                            SearchView()
                        }
                )
                .padding(.top, 10)
                
                Text("Spécialiste")
                    .padding(.top, 20)
                    .font(.headline)
                
                HStack {
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "stethoscope")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .padding(7.5)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                    .tint(Color.gray.opacity(0.1))
                    
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "figure.child")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .padding(7.5)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                    .tint(Color.gray.opacity(0.1))
                    
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "syringe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .padding(7.5)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                    .tint(Color.gray.opacity(0.1))
                    
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: "figure.elliptical")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .padding(7.5)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                    .tint(Color.gray.opacity(0.1))
                    
                    
                }
                .frame(maxWidth: 700, maxHeight: 60, alignment: .center)
                
                Text("Mes prochains rendez-vous")
                    .padding(.top, 20)
                    .font(.headline)
                
                List {
                    
                    Text ("blabla")
                    
                }
                
                Text("Docteur à proximité")
                    .padding(.top, 20)
                    .font(.headline)
                
                List {
                    Text ("blabla")
                }
                
                
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}
