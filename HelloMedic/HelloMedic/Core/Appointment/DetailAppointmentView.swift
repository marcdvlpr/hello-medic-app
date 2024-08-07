//
//  DetailAppointmentView.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import SwiftUI

struct DetailAppointmentView: View {
    var body: some View {
        UIKitDetailAppointmentView(isPast: true, dateRdv: "", heureRdv: "", nameImageSpecialist: "", nameSpecialist: "", specialitySpecialist: "", motif: "", place: "", phone: "", pay: "", document: "Ordonnance")
    }
}

#Preview {
    DetailAppointmentView()
}

struct UIKitDetailAppointmentView: UIViewControllerRepresentable {
    let isPast : Bool
    let dateRdv : String
    let heureRdv : String
    let nameImageSpecialist : String
    let nameSpecialist : String
    let specialitySpecialist : String
    let motif : String
    let place : String
    let phone : String
    let pay : String
    let document : String
    
    func makeUIViewController(context: Context) -> some DetailAppointmentViewController {
        return DetailAppointmentViewController(isPast: isPast, dateRdv: dateRdv, heureRdv: heureRdv, nameImageSpecialist: nameImageSpecialist, nameSpecialist: nameSpecialist, specialitySpecialist: specialitySpecialist, motif: motif, place: place, phone: phone, pay: pay, document: document)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothing to do
    }
}
