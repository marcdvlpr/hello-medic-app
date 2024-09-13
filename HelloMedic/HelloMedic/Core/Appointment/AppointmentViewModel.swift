//
//  AppointmentViewModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import Foundation

class AppointmentViewModel: ObservableObject {
    @Published var appointments: [Appointment] = []
    var pastAppointment : [Appointment] = []
    var upComingAppointment : [Appointment] = []
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Le format de date ISO 8601
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    func fetchAppointments() {
        let urlString = "http://localhost:3000/appointments"
        
        guard let url = URL(string : urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                    do {
                        let decodedAppointments = try JSONDecoder().decode([Appointment].self, from: data)
                        DispatchQueue.main.async {
                            self.appointments = decodedAppointments
                        }
                    } catch {
                        print("Error decoding data \(error)")
                    }
            } else if let error = error {
                print("Error fetching data: \(error)")
            }
        }.resume()
    }
    
    func pastAppointments() -> [Appointment] {
            let now = Date()
            return appointments.filter { appointment in
                guard let appointmentDate = dateFormatter.date(from: appointment.dateHeureRdv) else {
                    return false
                }
                return appointmentDate < now
            }
        }
        
    func upComingAppointments() -> [Appointment] {
        let now = Date()
        return appointments.filter { appointment in
            guard let appointmentDate = dateFormatter.date(from: appointment.dateHeureRdv) else {
                return false
            }
            return appointmentDate >= now
        }
    }
    
    func cancelAppointment(_ appointment: Appointment) {
        // Modifiez l'objet pour marquer comme annulé (une nouvelle instance de l'objet est nécessaire)
        guard let index = appointments.firstIndex(where: { $0.id == appointment.id }) else {
            return
        }
        var updatedAppointment = appointments[index]
        updatedAppointment.isCanceled = true
        
        // Mettre à jour la liste des rendez-vous avec l'objet modifié
        appointments[index] = updatedAppointment
        
        // Ajouter à la liste des rendez-vous passés
        pastAppointment.append(updatedAppointment)
    }
    
    func formattedDate(date dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Format de la date dans le JSON
        dateFormatter.locale = Locale(identifier: "fr_FR")
        dateFormatter.timeZone = TimeZone.current
        
        // Convertir la chaîne en Date
        guard let date = dateFormatter.date(from: dateString) else {
            return "Date invalide" // Retourner un message d'erreur si la conversion échoue
        }
        
        // Formater la Date en une chaîne avec le format désiré
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "EE d MMMM yyyy"
//        outputFormatter.dateStyle = .medium
        outputFormatter.locale = Locale(identifier: "fr_FR")
        return outputFormatter.string(from: date)
    }
    
    func formattedTime(date dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Format de la date dans le JSON
        
        // Convertir la chaîne en Date
        guard let date = dateFormatter.date(from: dateString) else {
            return "Heure invalide" // Retourner un message d'erreur si la conversion échoue
        }
        
        // Formater la Date en une chaîne avec le format désiré
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        timeFormatter.dateStyle = .none // Ne pas inclure la date
        return timeFormatter.string(from: date)
    }
}

