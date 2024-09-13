//
//  DetailAppointmentView.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import SwiftUI

struct DetailAppointmentView: View {
    var body: some View {
        UIKitDetailAppointmentView(isPast: true, appointment: Appointment(id: UUID(), place: "", document: Document(nom: "", namePicto: ""), dateHeureRdv: "Date()", motif: "", isCanceled: false, specialistId: "1"), dateRdv: "", heureRdv: "")
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
        return DetailAppointmentViewController(isPast: isPast, appointment: appointment, dateRdv: dateRdv, heureRdv: heureRdv)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothing to do
    }
}
