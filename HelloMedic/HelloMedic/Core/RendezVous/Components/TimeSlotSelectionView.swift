//
//  TimeSlotSelectionView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 25/08/2024.
//

import SwiftUI

struct TimeSlotSelectionView: View {
   let timeSlots: [TimeSlot]
   @Binding var selectedTime: String?

   var body: some View {
      VStack {
         Text("Choisissez l'heure")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .font(.system(size: 20))

         LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
            ForEach(timeSlots) { slot in
               Button(action: {
                  selectedTime = slot.time
                  print("Créneau sélectionné : \(slot.time)")
               }) {
                  Text(slot.time)
                     .font(.subheadline)
                     .frame(width: 100, height: 50)
                     .background(backgroundColor(for: slot))
                     .foregroundColor(foregroundStyle(for: slot))
                     .clipShape(RoundedRectangle(cornerRadius: 8))
                     .overlay(
                        RoundedRectangle(cornerRadius: 8)
                           .stroke(Color.gray, lineWidth: 0.5)
                     )
               }
               .disabled(!slot.isAvailable)
            }
         }
      }
   }

   private func backgroundColor(for slot: TimeSlot) -> Color {
      if !slot.isAvailable {
         return Color.gray.opacity(0.3)
      } else if selectedTime == slot.time {
         return Color.blue
      } else {
         return Color.white
      }
   }

   private func foregroundStyle(for slot: TimeSlot) -> Color {
      if !slot.isAvailable {
         return Color.black
      } else if selectedTime == slot.time {
         return Color.white
      } else {
         return Color.black
      }
   }
}
