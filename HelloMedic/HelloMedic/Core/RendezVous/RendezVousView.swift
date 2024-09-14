//
//  RendezVousView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 24/08/2024.
//

import SwiftUI

struct RendezVousView2: View {
   let careGiver: CareGiver
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
   @State private var isShowingSheet = false

   var body: some View {
      VStack {
         PractitionerCardViewRepresentable(careGiver: careGiver)
            .frame(height: 175)
            .padding()

         DateSelectionView(daysOfWeek: daysOfWeek, dates: dates, isDaySelected: isDaySelected)
            .padding(.bottom, 45)

         TimeSlotSelectionView(timeSlots: timeSlots, selectedTime: $selectedTime)
            .padding(.bottom, 50)

         Button(action: {
            isShowingSheet.toggle()
         }) {
            Text("Confirmer le rendez-vous")
               .padding()
               .frame(maxWidth: .infinity)
               .background(Color.blue)
               .foregroundColor(.white)
               .cornerRadius(8)
               .padding(20)
         }

            .sheet(isPresented: $isShowingSheet) {
               Confirm()
                  .presentationDetents([.height(230)])
            }
         .padding(.bottom, 15)
                        Spacer()
      }
   }
}

#Preview {
   RendezVousView2(careGiver: CareGiver( name: "Dr. Dupont", specialty: "Cardiologue", image: "medecin1", specialtyImage: "Généraliste"))
}
