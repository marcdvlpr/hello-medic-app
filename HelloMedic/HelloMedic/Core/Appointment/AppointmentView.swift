//
//  AppointmentView.swift
//  HelloMedic
//
//  Created by Klesya Loha on 19/07/2024.
//

import SwiftUI

struct AppointmentView: View {
    @State var secondView = false
    var body: some View {
        VStack {
            HStack(spacing: 0){
                Button(action: {
                    secondView = false
                }, label: {
                    VStack {
                        Text("À venir")
                            .fontWeight(.semibold)
                            .foregroundColor(.hmBlue)
                            .frame(width: 200.0)
                            .font(.system(size: 21))
                            .padding(.leading, 190.0)
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: UIScreen.main.bounds.width, height: 9
                            )
                            .overlay(
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(.hmBlue),
                                alignment: .bottom
                            )
                            .border(Color.clear)
                    }
                })
                
                Button(action: {
                    secondView = true
                }, label: {
                    VStack {
                        Text("Passés")
                            .fontWeight(.semibold)
                            .foregroundColor(.hmSkyBlue)
                            .frame(width: 200.0)
                            .font(.system(size: 21))
                            .padding(.trailing, 190.0)
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(width: UIScreen.main.bounds.width, height: 9)
                            .overlay(
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(.hmSkyBlue),
                                alignment: .bottom
                            )
                            .border(Color.clear)
                    }
                })
            }
            if secondView == false {
                UpComingAppointmentView()
            } else {
                PastAppointmentView()
            }
        }
    }
}

#Preview {
    AppointmentView()
}

struct UpComingAppointmentView: View {
    @StateObject private var appointmentViewModel = AppointmentViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(appointmentViewModel.upComingAppointments()) { appointment in
                    NavigationLink(destination: {
                        DetailAppointmentView()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 379, height: 166)
                                .cornerRadius(14)
                                .foregroundColor(.hmBlue)
                            
                            VStack {
                                HStack {
                                    Image(systemName: "calendar")
                                    Text(appointmentViewModel.formattedDate(date: appointment.dateHeureRdv))
                                    
                                    Spacer()
                                    
                                    Image(systemName: "timer")
                                    Text(appointmentViewModel.formattedTime(date: appointment.dateHeureRdv))
                                }
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40.0)
                                
                                Divider()
                                    .frame(width: 308.0, height: 1.0)
                                    .background(.white)
                                
                                HStack {
                                    Image(appointment.specialist.picture)
                                        .resizable()
                                        .frame(width: 62.0, height: 61.0)
                                        .cornerRadius(100
                                        )
                                    
                                    VStack (alignment: .leading) {
                                        Text("Dr. \(appointment.specialist.name) \(appointment.specialist.firstName.uppercased())")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 13))
                                        Text(appointment.specialist.speciality.nom)
                                            .fontWeight(.regular)
                                            .font(.system(size: 10))
                                        Text(appointment.motif)
                                            .fontWeight(.regular)
                                            .font(.system(size: 10))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .padding(.horizontal, 30.0)
                                .padding(.vertical, 3.0)
                                .foregroundColor(.white)
                                
                                HStack {
                                    Button(action: {
                                        
                                    }, label: {
                                        HStack{
                                            Image(systemName: "xmark")
                                            Text("Annuler")
                                                .fontWeight(.medium)
                                                .font(.system(size: 12))
                                        }
                                        .padding(.horizontal, 30.0)
                                        
                                    })
                                    .frame(height: 28)
                                    .buttonStyle(.borderedProminent)
                                    .cornerRadius(14)
                                    .accentColor(.hmSkyBlue)
                                    
                                    Button(action: {
                                        
                                    }, label: {
                                        HStack{
                                            Image(systemName: "pencil")
                                            Text("Modifier")
                                                .fontWeight(.medium)
                                                .font(.system(size: 12))
                                        }
                                        .padding(.horizontal, 30.0)
                                        
                                    })
                                    .frame(height: 28)
                                    .buttonStyle(.borderedProminent)
                                    .cornerRadius(14)
                                    .foregroundColor(.hmSkyBlue)
                                    .accentColor(.white)
                                }
                            }
                        }
                    })
                }
            }
        }
    }
}

struct PastAppointmentView: View {
    @StateObject private var appointmentViewModel = AppointmentViewModel()
    var body: some View {
        ScrollView {
            ForEach(appointmentViewModel.pastAppointments().reversed()) { appointment in
                ZStack {
                    Rectangle()
                        .frame(width: 379, height: 166)
                        .cornerRadius(14)
                        .foregroundColor(.hmSkyBlue)
                    
                    VStack {
                        HStack {
                            Image(systemName: "calendar")
                            Text(appointmentViewModel.formattedDate(date: appointment.dateHeureRdv))
                                
                            Spacer()
                            
                            Image(systemName: "timer")
                            Text(appointmentViewModel.formattedTime(date: appointment.dateHeureRdv))
                        }
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40.0)
                        
                        Divider()
                            .frame(width: 308.0, height: 1.0)
                            .background(.white)
                        
                        HStack {
                            Image(appointment.specialist.picture)
                                .resizable()
                                .frame(width: 62.0, height: 61.0)
                                .cornerRadius(100
                                )
                            
                            VStack (alignment: .leading) {
                                Text("Dr. \(appointment.specialist.name) \(appointment.specialist.firstName.uppercased())")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 13))
                                Text(appointment.specialist.speciality.nom)
                                    .fontWeight(.regular)
                                    .font(.system(size: 10))
                                Text(appointment.motif)
                                    .fontWeight(.regular)
                                    .font(.system(size: 10))
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                        }
                        .padding(.horizontal, 30.0)
                        .padding(.vertical, 3.0)
                        .foregroundColor(.white)
                        
                        Button(action: {
                            
                        }, label: {
                            HStack{
                                Image(systemName: "goforward")
                                Text("Reprogrammer un rendez-vous")
                                    .fontWeight(.medium)
                                    .font(.system(size: 12))
                            }
                            .padding(.horizontal, 30.0)
                                
                        })
                        .frame(height: 28)
                        .buttonStyle(.borderedProminent)
                        .cornerRadius(14)
                        .foregroundColor(.hmBlue)
                        .accentColor(.white)
                    }
                }
            }
        }
    }
}
