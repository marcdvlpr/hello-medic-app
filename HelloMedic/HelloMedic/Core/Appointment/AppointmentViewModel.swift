//
//  AppointmentViewModel.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import Foundation

class AppointmentViewModel: ObservableObject {
    @Published var appointments: [Appointment] = []
    var viewModel = ProfilSpecialistViewModel()
    
    init() {
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "EEEE d MMMM yyyy HH:mm" // Ajustez le format selon vos besoins
                dateFormatter.locale = Locale(identifier: "fr_FR")
        
        self.appointments = [
            Appointment(dateHeureRdv: dateFormatter.date(from: "Mardi 7 Mai 2024 10:00")!, isAccepted: true, motif: "Bilan de santé", isCanceled: false, specialist: viewModel.specialists[5]),
            Appointment(dateHeureRdv: dateFormatter.date(from: "Jeudi 9 Juillet 2024 12:00")!, isAccepted: true, motif: "Soins post-opératoires", isCanceled: false, specialist: viewModel.specialists[7]),
            Appointment(dateHeureRdv: dateFormatter.date(from: "Vendredi 12 Juillet 2024 13:15")!, isAccepted: true, motif: "Changement pansement", isCanceled: false, specialist: viewModel.specialists[7]),
            Appointment(dateHeureRdv: dateFormatter.date(from: "Vendredi 19 Juillet 2024 13:15")!, isAccepted: true, motif: "Changement pansement", isCanceled: false, specialist: viewModel.specialists[7]),
            Appointment(dateHeureRdv: dateFormatter.date(from: "Mardi 23 Juillet 2024 14:00")!, isAccepted: true, motif: "Rappel vaccin", isCanceled: false, specialist: viewModel.specialists[5]),
            Appointment(dateHeureRdv: dateFormatter.date(from: "Jeudi 30 Juillet 2024 16:00")!, isAccepted: true, motif: "Rééducation post-opératoire", isCanceled: false, specialist: viewModel.specialists[3]),
            Appointment(dateHeureRdv: dateFormatter.date(from: "Mercredi 21 Août 2024 14:00")!, isAccepted: true, motif: "Maux de tête et migraines", isCanceled: false, specialist: viewModel.specialists[4]),
            Appointment(dateHeureRdv: dateFormatter.date(from: "Lundi 2 Septembre 2024 17:00")!, isAccepted: true, motif: "Examens de routine et suivi de croissance", isCanceled: false, specialist: viewModel.specialists[1])
        ]
    }
    
    func pastAppointments() -> [Appointment] {
            return appointments.filter { $0.dateHeureRdv < Date() }
    }
        
    func upComingAppointments() -> [Appointment] {
        return appointments.filter { $0.dateHeureRdv >= Date() }
    }
        
    func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE d MMMM yyyy"
//        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "fr_FR")
        return dateFormatter.string(from: date)
    }
        
    func formattedTime(date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        return timeFormatter.string(from: date)
    }
}
