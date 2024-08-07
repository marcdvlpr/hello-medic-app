//
//  ProfilSpecialistView.swift
//  HelloMedic
//
//  Created by Klesya Loha on 05/08/2024.
//

import SwiftUI
import MapKit

struct ProfilSpecialistView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8708, longitude: 2.3155), // Centre du 75008 Paris
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1) // Vue zoomée
        )
        
        private let circleCenter = Location(id: UUID(), coordinate: CLLocationCoordinate2D(latitude: 48.8708, longitude: 2.3155))
    
    var body: some View {
        ScrollView {
            Image("drmeredith")
                .cornerRadius(100)
            Text("Dr Meredith FEERGRT")
                .foregroundStyle(.hmBlue)
                .fontWeight(.semibold)
                .font(.system(size: 16))
            Text("Médecin généraliste")
                .foregroundStyle(.hmBlue)
                .fontWeight(.regular)
                .font(.system(size: 13))
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: "calendar.badge.plus")
                    Text("Prendre rendez-vous")
                        .fontWeight(.medium)
                        .font(.system(size: 12))
                }
                    .foregroundColor(.white)
                    .frame(width: 217, height: 28)
                    .buttonStyle(.borderedProminent)
                    .background(.hmGreen)
                    .cornerRadius(14)
            })
            
                    VStack {
                        VStack {
                            SectionTitle(sectionName: "Périmètre", sectionPictureName: "location.magnifyingglass", divider: false, last: false ,sectionContent: {
                                
                                VStack {
                                    Text("~ 20km autour de 75008 Paris")
                                        .foregroundStyle(.hmBlue)
                                        .fontWeight(.light)
                                        .font(.system(size: 14))
                                    
                                    Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [circleCenter]) { location in
                                            MapAnnotation(coordinate: location.coordinate) {
                                                Circle()
                                                    .strokeBorder(Color.blue, lineWidth: 2)
                                                    .background(Circle().fill(Color.blue.opacity(0.1)))
                                                    .frame(width: 200, height: 200) // Taille approximative pour le cercle
                                            }
                                        }
                                    .cornerRadius(14)
                                    .frame(width: 274,height: 122)
                                    .onAppear {
                                        // Ajuster la vue pour inclure le cercle
                                        region.span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
                                    }
                                }
                            })
                        }.padding(.top)
                        
                        SectionTitle(sectionName: "Horaires", sectionPictureName: "person.badge.clock.fill", divider: true, last: false, sectionContent: {
                            
                            HStack{
                                Spacer()
                                    .frame(width: 56)
                                Text("Aujourd'hui")
                                Spacer()
                                Text("08:00 - 19:00")
                                Spacer()
                                    .frame(width: 56)
                            }
                            
                        })
                        
                        SectionTitle(sectionName: "Contact", sectionPictureName: "phone.fill", divider: true, last: false, sectionContent: {
                            Text("01 12 23 34 56")
                        })
                        
                        SectionTitle(sectionName: "Langues", sectionPictureName: "flag.fill", divider: true, last: false, sectionContent: {
                            Text("Francais\nAnglais")
                                .multilineTextAlignment(.center)
                        })
                        
                        SectionTitle(sectionName: "Certifications", sectionPictureName: "checkmark.seal.fill", divider: true, last: false, sectionContent: {
                            VStack {
                                Text("Diplôme d’État de docteur en médecine")
                                    .fontWeight(.regular)
                                Text("Faculté de médecine Paris 6")
                            }
                        })
                        VStack {
                            SectionTitle(sectionName: "Veuillez préparer le nécessaire pour la venue du praticien", sectionPictureName: "checkmark.circle.fill", divider: true, last: true, sectionContent: {
                                    Text("• carte vitale\n• carnet de santé\n• les traitements en cours\n• informer pour toute allergie et/ou interventions récentes")
                            })
                        }.background(
                            ZStack {
                                Rectangle()
                                    .padding(.horizontal, 40.0)
                                    .padding(.bottom, 20)
                                    .foregroundColor(.hmGreen)
                                Rectangle()
                                    .cornerRadius(14)
                                    .padding(.horizontal, 40.0)
                                    .foregroundColor(.hmGreen)
                            }
                    )
                    }
                    .background(
                        ZStack {
                            Rectangle()
                                .cornerRadius(14)
                                .padding(.horizontal, 40)
                                .foregroundColor(.hmBlue)
                                .offset(y: -3)
                            Rectangle()
                                .cornerRadius(14)
                                .padding(.horizontal, 40)
                                .foregroundColor(.white)
                                .shadow(radius: 3)
                        }
                    )
        }
    }
}

struct Location: Identifiable {
    let id: UUID
    let coordinate: CLLocationCoordinate2D
}

#Preview {
    ProfilSpecialistView()
}

struct SectionTitle<Content: View> : View {
    let sectionName: String
    let sectionPictureName : String
    let sectionContent : Content
    let divider : Bool
    let last : Bool
    
    init(sectionName: String, sectionPictureName: String, divider: Bool, last: Bool, @ViewBuilder sectionContent: () -> Content) {
        self.sectionName = sectionName
        self.sectionPictureName = sectionPictureName
        self.sectionContent = sectionContent()
        self.divider = divider
        self.last = last
    }
    
    var body: some View {
        if divider {
            Divider()
                .padding(.horizontal, 40)
                .padding(.bottom, 16)
        }
        HStack (spacing: 3) {
            Spacer()
                .frame(width: 56)
            Image(systemName: sectionPictureName)
            Text(sectionName)
                .padding(.trailing, 16.0)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .font(.system(size: 14))
        .fontWeight(.semibold)
        .foregroundColor(last ? .white : .hmBlue)
        Spacer()
            .frame(height: 10)
        sectionContent
            .padding(.bottom, 16)
            .padding(.horizontal, 20.0)
            .foregroundStyle(last ? .white : .hmBlue)
            .fontWeight(.light)
            .font(.system(size: 14))
    }
}
