//
//  FilterCareGiverView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 17/08/2024.
//

import SwiftUI

struct FilterCareGiverView: View {
   let careGivers: [CareGiver]
   @Binding var selectedSpecialty: String?
   @Binding var searchText: String

   var body: some View {
      ScrollView(.horizontal, showsIndicators: false) {
         HStack(spacing: 5) {
            ForEach(careGivers) { caregiver in
               VStack {
                  Image(systemName: caregiver.specialtyImage)
                     .resizable()
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 50, height: 50)
                     .padding(10)
                     .background(Color.white)
                     .clipShape(Circle())
                     .containerRelativeFrame(.horizontal, count: 4,spacing: 15)
                     .overlay(Circle().stroke(Color.gray, lineWidth: 0.5))
                     .foregroundStyle(.blue)
                     .onTapGesture {
                        selectedSpecialty = caregiver.specialty
                        searchText = ""
                        print("Selected Specialty: \(caregiver.specialty)")
                     }
                  Text(caregiver.specialty)
                     .font(.caption)
               }
            }
         }
         .padding(.top, 27)
      }
      .padding(.horizontal)
   }
}
