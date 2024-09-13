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
    @StateObject private var profilSpecialistViewModel = DoctorListViewModel()
    
    @State private var isSheetPresented = false
    var isCurrentDay : Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(appointmentViewModel.upComingAppointments()) { appointment in
                    
                    NavigationLink(destination: {
                        UIKitDetailAppointmentView(isPast: false, appointment: appointment, dateRdv: appointmentViewModel.formattedDate(date: appointment.dateHeureRdv), heureRdv: appointmentViewModel.formattedTime(date: appointment.dateHeureRdv))
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 379, height: 166)
                                .cornerRadius(14)
                                .foregroundColor(isToday(appointment.dateHeureRdv) ? .hmGreen : .hmBlue)
                            
                            VStack {
                                HStack {
                                    HStack(spacing: 3) {
                                        Image(systemName: "calendar")
                                        Text(appointmentViewModel.formattedDate(date: appointment.dateHeureRdv))
                                    }
                                    
                                    Spacer()
                                    
                                    HStack(spacing: 3) {
                                        Image(systemName: "timer")
                                        if isToday(appointment.dateHeureRdv) && isWithin24Hours(appointment.dateHeureRdv) {
                                            Text(timeRemaining(appointment.dateHeureRdv))
                                        } else {
                                            Text(appointmentViewModel.formattedTime(date: appointment.dateHeureRdv))
                                        }
                                    }
                                }
                                .font(.system(size: 14))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                                .padding(.horizontal, 40.0)
                                
                                Divider()
                                    .frame(width: 308.0, height: 1.0)
                                    .background(.white)
                                
                                HStack {
                                    AsyncImage(url: URL(string: profilSpecialistViewModel.getDoctorById(appointment.specialistId).pict)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 62.0, height: 61.0)
                                            .cornerRadius(100)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 50.0, height: 50.0)
                                    }
                                    
                                    VStack (alignment: .leading) {
                                        Text("Dr. \(profilSpecialistViewModel.getDoctorById(appointment.specialistId).name)")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 15))
                                        Text(profilSpecialistViewModel.getDoctorById(appointment.specialistId).specialty)
                                            .fontWeight(.regular)
                                            .font(.system(size: 12))
                                        Text(appointment.motif)
                                            .fontWeight(.regular)
                                            .font(.system(size: 12))
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                }
                                .padding(.horizontal, 30.0)
                                .padding(.vertical, 3.0)
                                .foregroundColor(.white)
                                
                                if !isToday(appointment.dateHeureRdv) {
                                    HStack {
                                        Button(action: {
                                            appointmentViewModel.cancelAppointment(appointment)
                                        }, label: {
                                            HStack{
                                                Image(systemName: "xmark")
                                                Text("Annuler")
                                                    .fontWeight(.medium)
                                                    .font(.system(size: 12))
                                            }
                                            .foregroundColor(.white)
                                            .frame(width: 150, height: 28)
                                            .buttonStyle(.borderedProminent)
                                            .background(.hmSkyBlue)
                                            .cornerRadius(14)
                                        })
                                        
                                        Button(action: {
                                            
                                        }, label: {
                                            HStack{
                                                Image(systemName: "pencil")
                                                Text("Modifier")
                                                    .fontWeight(.medium)
                                                    .font(.system(size: 12))
                                            }
                                            .foregroundColor(.hmSkyBlue)
                                            .frame(width: 150, height: 28)
                                            .buttonStyle(.borderedProminent)
                                            .background(.white)
                                            .cornerRadius(14)
                                            
                                        })
                                    }
                                } else {
                                    Button {
                                        isSheetPresented.toggle()
                                    } label: {
                                        HStack{
                                            Image(systemName: "arrowshape.right.fill")
                                            Text("Suivre le trajet")
                                                .fontWeight(.medium)
                                                .font(.system(size: 12))
                                        }
                                        .foregroundColor(.hmGreen)
                                        .frame(width: 150, height: 28)
                                        .buttonStyle(.borderedProminent)
                                        .background(.white)
                                        .cornerRadius(14)
                                    }
                                    .sheet(isPresented: $isSheetPresented){
                                        AppointmentDetailsView()
                                    }
                                }
                            }
                        }
                    })
                }
            }
        }
        .onAppear {
            appointmentViewModel.fetchAppointments()
            profilSpecialistViewModel.fetchDoctors()
        }
    }
    
    func isToday(_ dateString: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Format de la date dans le JSON
        
        // Convertir la chaîne en Date
        guard let date = dateFormatter.date(from: dateString) else {
            return false // Retourner false si la conversion échoue
        }
        
        let calendar = Calendar.current
        let today = Date()
        
        // Extraire les composants de la date actuelle
        let todayComponents = calendar.dateComponents([.year, .month, .day], from: today)
        // Extraire les composants de la date à vérifier
        let dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        
        // Comparer les composants
        return todayComponents == dateComponents
    }
    
    func isWithin24Hours(_ dateString: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Assurez-vous que le format correspond à celui de votre chaîne de date

        // Convertir la chaîne en Date
        guard let date = dateFormatter.date(from: dateString) else {
            return false // Retourner false si la conversion échoue
        }
        
        let now = Date()
        let calendar = Calendar.current
        
        // Calculer la différence entre maintenant et la date
        if let difference = calendar.dateComponents([.hour], from: now, to: date).hour {
            return difference >= 0 && difference <= 24
        }
        
        return false
    }
        
    func timeRemaining(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Assurez-vous que le format correspond à celui de votre chaîne de date

        // Convertir la chaîne en Date
        guard let date = dateFormatter.date(from: dateString) else {
            return "Invalid date format" // Retourner un message d'erreur si la conversion échoue
        }

        let now = Date()
        let calendar = Calendar.current

        // Calculer la différence en heures, minutes et secondes
        let components = calendar.dateComponents([.hour, .minute, .second], from: now, to: date)
        
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        // let seconds = components.second ?? 0
        
        if hours != 0 {
            return String(format: "-%02dh", hours)
        } else {
            return String(format: "-%01dmin", minutes)
        }
    }
}

struct PastAppointmentView: View {
    @StateObject private var appointmentViewModel = AppointmentViewModel()
    @StateObject private var profilSpecialistViewModel = DoctorListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(appointmentViewModel.pastAppointments().reversed()) { appointment in
                    NavigationLink(destination: {
                        UIKitDetailAppointmentView(isPast: true, appointment: appointment, dateRdv: appointmentViewModel.formattedDate(date: appointment.dateHeureRdv), heureRdv: appointmentViewModel.formattedTime(date: appointment.dateHeureRdv))
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 379, height: 166)
                                .cornerRadius(14)
                                .foregroundColor(.hmSkyBlue)
                            
                            VStack {
                                HStack(spacing: 3) {
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
                                    AsyncImage(url: URL(string: profilSpecialistViewModel.getDoctorById(appointment.specialistId).pict)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 62.0, height: 61.0)
                                            .cornerRadius(100
                                            )
                                        
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 50.0, height: 50.0)
                                    }
                                        
                                    
                                    VStack (alignment: .leading) {
                                        Text("Dr. \(profilSpecialistViewModel.getDoctorById(appointment.specialistId).name)")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 15))
                                        Text(profilSpecialistViewModel.getDoctorById(appointment.specialistId).specialty)
                                            .fontWeight(.regular)
                                            .font(.system(size: 12))
                                        Text(appointment.motif)
                                            .fontWeight(.regular)
                                            .font(.system(size: 12))
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
                                    .foregroundColor(.hmBlue)
                                    .frame(width: 256, height: 28)
                                    .buttonStyle(.borderedProminent)
                                    .background(.white)
                                    .cornerRadius(14)
                                        
                                })
                            }
                        }
                    })
                }
            }
        }
        .onAppear {
            appointmentViewModel.fetchAppointments()
            profilSpecialistViewModel.fetchDoctors()
        }
    }
}
