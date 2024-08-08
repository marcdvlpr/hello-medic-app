//
//  DetailAppointmentView.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import SwiftUI

struct DetailAppointmentView: View {
    var body: some View {
        UIKitDetailAppointmentView(isPast: true, appointment: Appointment(place: "", document: Document(nom: "", namePicto: ""), dateHeureRdv: Date(), isAccepted: true, motif: "", isCanceled: false, specialist: ProfilSpecialist(nameImage: "", name: "", firstName: "", perimeter: "", phoneNumber: "", paymentMethod: "", languages: "", horaires: "", certification: Certification(school: "", diplome: ""), speciality: Speciality(nom: "", image: ""))), dateRdv: "", heureRdv: "")
    }
}

#Preview {
    DetailAppointmentView()
}

struct UIKitDetailAppointmentView: UIViewControllerRepresentable {
    var isPast : Bool
    let appointment : Appointment
    let dateRdv : String
    let heureRdv : String
    
    func makeUIViewController(context: Context) -> some DetailAppointmentViewController {
        return DetailAppointmentViewController(isPast: isPast, appointment: Appointment(place: appointment.place, document: appointment.document, dateHeureRdv: Date(), isAccepted: true, motif: appointment.motif, isCanceled: false, specialist: appointment.specialist), dateRdv: dateRdv, heureRdv: heureRdv)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothing to do
    }
}
