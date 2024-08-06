//
//  DetailAppointmentView.swift
//  HelloMedic
//
//  Created by Klesya Loha on 29/07/2024.
//

import SwiftUI

struct DetailAppointmentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        UIKitDetailAppointmentView()
    }
}

#Preview {
    DetailAppointmentView()
}

struct UIKitDetailAppointmentView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some DetailAppointmentViewController {
        return DetailAppointmentViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // nothing to do
    }
}
