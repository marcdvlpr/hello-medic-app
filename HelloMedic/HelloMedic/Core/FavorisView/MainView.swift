//
//  MainView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 17/08/2024.
//

import SwiftUI

struct MainView: View {
   @State private var searchText = ""
   @State private var selectedSpecialty: String? = nil
   @State private var favoriteCareGivers = FavoriteCareGiversData.careGivers

   var filteredCareGivers: [CareGiver] {
      favoriteCareGivers.filter { caregiver in
         (selectedSpecialty == nil || caregiver.specialty == selectedSpecialty) &&
         (searchText.isEmpty ||
          caregiver.name.localizedCaseInsensitiveContains(searchText) ||
          caregiver.specialty.localizedCaseInsensitiveContains(searchText))
      }
   }

   var body: some View {
      NavigationView {
         VStack {
            FilterCareGiverView(
               careGivers: favoriteCareGivers,
               selectedSpecialty: $selectedSpecialty,
               searchText: $searchText
            )
            Text("Favoris")
               .font(.system(.title3, weight: .bold))
               .frame(maxWidth: .infinity, alignment: .leading)
               .padding(10)
            CareGiverList(careGivers: filteredCareGivers)
         }
         .navigationTitle("Bonjour, Lisa")
         .searchable(text: $searchText, prompt: "rechercher une spécialité")
         .onChange(of: searchText) { oldValue, newValue in
            selectedSpecialty = nil
            print("Search Text: \(newValue)")
         }
      }
   }
}



#Preview {
   MainView()
}

