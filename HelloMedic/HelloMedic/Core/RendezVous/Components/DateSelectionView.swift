//
//  DateSelectionView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 25/08/2024.
//

import SwiftUI

struct DateSelectionView: View {
   let daysOfWeek: [String]
   let dates: [String]
   let isDaySelected: [Bool]

   var body: some View {
      VStack {
         Text("Choisissez une date")
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .font(.system(size: 20))

         HStack(spacing: 10) {
            ForEach(daysOfWeek.indices, id: \.self) { index in
               Button(action: {
                  print("Bouton \(daysOfWeek[index]) \(dates[index]) cliqué")
               }) {
                  VStack(spacing: 9) {
                     Text(daysOfWeek[index])
                        .font(.subheadline)
                     Text("\(dates[index])")
                        .font(.headline)
                  }
                  .frame(width: 60, height: 70)
                  .background(isDaySelected[index] ? Color.blue : Color.white)
                  .foregroundStyle(isDaySelected[index] ? .white : .black)
                  .cornerRadius(8)
                  .overlay(
                     RoundedRectangle(cornerRadius: 8)
                        .stroke(isDaySelected[index] ? Color.blue : Color.gray, lineWidth: 0.5)
                  )
               }
            }
         }
         .frame(maxWidth: .infinity)
      }
   }
}
