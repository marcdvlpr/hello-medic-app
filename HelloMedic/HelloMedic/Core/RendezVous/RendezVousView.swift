//
//  RendezVousView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 24/08/2024.
//


import SwiftUI

struct RendezVousView2: View {
   let daysOfWeek: [String] = ["Lun", "Mar", "Mer", "Jeu", "Ven"]
   let dates: [String] = ["8", "9", "10", "11", "12"]
   let isDaySelected: [Bool] = [false, false, false, true, false]

   let timeSlots: [TimeSlot] = [
      TimeSlot(time: "9:00 AM", isAvailable: false),
      TimeSlot(time: "10:00 AM", isAvailable: true),
      TimeSlot(time: "11:00 AM", isAvailable: true),
      TimeSlot(time: "9:30 AM", isAvailable: true),
      TimeSlot(time: "10:30 AM", isAvailable: true),
      TimeSlot(time: "11:30 AM", isAvailable: true)
   ]

   @State private var selectedTime: String? = nil

   var body: some View {
      ZStack {
         Color(white: 0.9).edgesIgnoringSafeArea(.all)

         VStack {
            Spacer()

            DateSelectionView(daysOfWeek: daysOfWeek, dates: dates, isDaySelected: isDaySelected)
               .padding(.bottom, 60)

            TimeSlotSelectionView(timeSlots: timeSlots, selectedTime: $selectedTime)
               .padding(.bottom, 60)

            ConfirmationButton()
         }
      }
   }
}

#Preview {
   RendezVousView2()
}
