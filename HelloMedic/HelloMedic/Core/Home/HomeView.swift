//
//  HomeView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 19/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isSearchViewActive = false
    @StateObject private var doctorslist = DoctorListViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Bonjour, Lisa")
                    .foregroundColor(.blue)
                    .font(.title2)
                    .padding(.top, 10)
                
                //filtered button
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
                    .frame(maxWidth: 600, maxHeight: 10, alignment: .center)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 0.2)
                    
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
                            .foregroundColor(Color.hmBlue)
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
                            .foregroundColor(Color.hmBlue)
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
                            .foregroundColor(Color.hmBlue)
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
                            .foregroundColor(Color.hmBlue)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.circle)
                    .tint(Color.gray.opacity(0.1))
                    
                    
                }
                .frame(maxWidth: 700, maxHeight: 30, alignment: .center)
                
                Text("Mes prochains rendez-vous")
                    .padding(.top, 20)
                    .font(.headline)
                
                // Next appointment
                VStack() {
                    HStack {
                        Image("drnicolas")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("Dr. François BENHAMOU")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Médecin généraliste")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    Divider()
                        .frame(height: 2)
                        .background(.white)
                        .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                    
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                        Text("Lundi 03 Septembre")
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "clock")
                            .foregroundColor(.white)
                        Text("10:00 - 11:00")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                .background(Color.hmBlue)
                .cornerRadius(10)
                .padding()
                
                Text("Docteur à proximité")
                    .padding(.top, 20)
                    .font(.headline)
                
                List {
                    DoctorView()
                }
                .cornerRadius(20)
                
                
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView()
}


struct DoctorView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some HomeViewController {
        return HomeViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
}
