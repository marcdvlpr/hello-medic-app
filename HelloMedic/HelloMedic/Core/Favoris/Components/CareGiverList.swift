//
//  CareGiverList.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 17/08/2024.
//

import SwiftUI

struct CareGiverList: View {
   let careGivers: [CareGiver]

   var body: some View {
      List {
         ForEach(careGivers) { caregiver in
            HStack {
               Image(caregiver.image)
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width: 70, height: 70)
                  .clipShape(Circle())
               VStack(alignment: .leading) {
                  Text(caregiver.name)
                     .font(.headline)
                  Text(caregiver.specialty)
                     .font(.subheadline)
                     .foregroundStyle(.secondary)
               }
            }
         }
      }
      .listStyle(PlainListStyle())
   }
}

