//
//  HomeView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 19/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var doctorslist = DoctorListViewModel()
    @State private var isSearchViewActive = false
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading) {
                Text("Bonjour, John Doe")
                    .foregroundColor(.blue)
                    .font(.title2)
                    .padding(.top, 10)
                
                // Bouton de recherche
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
                    VStack {
                        NavigationLink(destination: FilterButtonView().environmentObject(doctorslist).onAppear {
                            doctorslist.specialty = "Médecin généraliste"
                        }) {
                            Image(systemName: "stethoscope")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding(7.5)
                                .foregroundColor(Color.hmBlue)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.circle)
                        .tint(Color.gray.opacity(0.1))
                        
                        Text("Généraliste")
                    }
                    .padding(.top, 50)
                    
                    VStack {
                        NavigationLink(destination: FilterButtonView().environmentObject(doctorslist).onAppear {
                            doctorslist.specialty = "Pédiatre"
                        }) {
                            Image(systemName: "figure.child")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding(7.5)
                                .foregroundColor(Color.hmBlue)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.circle)
                        .tint(Color.gray.opacity(0.1))
                        
                        Text("Pédiatre")
                    }
                    .padding(.top, 50)
                    
                    VStack {
                        NavigationLink(destination: FilterButtonView().environmentObject(doctorslist).onAppear {
                            doctorslist.specialty = "Infirmière"
                        }) {
                            Image(systemName: "syringe")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding(7.5)
                                .foregroundColor(Color.hmBlue)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.circle)
                        .tint(Color.gray.opacity(0.1))
                        
                        Text("Infirmière")
                    }
                    .padding(.top, 50)
                    
                    VStack {
                        NavigationLink(destination: FilterButtonView().environmentObject(doctorslist).onAppear {
                            doctorslist.specialty = "Kinésithérapeute"
                        }) {
                            Image(systemName: "figure.elliptical")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                                .padding(7.5)
                                .foregroundColor(Color.hmBlue)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.circle)
                        .tint(Color.gray.opacity(0.1))
                        
                        Text("Kiné")
                        
                    }
                    .padding(.top, 50)
                    
                    
                }
                .frame(maxWidth: 700, maxHeight: 30, alignment: .center)
                
                Text("Mes prochains rendez-vous")
                    .padding(.top, 60)
                    .font(.headline)
                
                
                NavigationLink(destination: AppointmentView()) {
                    // Next appointment
                    VStack() {
                        HStack {
                            Image("drfrancois")
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
                            Text("Lundi 03 Décembre 2024")
                                .foregroundColor(.white)
                                .fixedSize(horizontal: false, vertical: true)
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
                    
                }
                
                Text("Docteur à proximité")
                    .padding(.top, 10)
                    .font(.headline)
                
                VStack {
                    DoctorView()
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


struct DoctorView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some HomeViewController {
        return HomeViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
}
