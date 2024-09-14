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
   @State private var selectedCareGiver: CareGiver? = nil

   var filteredCareGivers: [CareGiver] {
      favoriteCareGivers.filter { caregiver in
         (selectedSpecialty == nil || caregiver.specialty == selectedSpecialty) &&
         (searchText.isEmpty ||
          caregiver.name.localizedCaseInsensitiveContains(searchText) ||
          caregiver.specialty.localizedCaseInsensitiveContains(searchText))
      }
   }

   func resetCareGivers() {
      searchText = ""
      selectedSpecialty = nil
      favoriteCareGivers = FavoriteCareGiversData.careGivers
   }

   var body: some View {
      NavigationView { // Modifié
         VStack {
            FilterCareGiverView(
               careGivers: favoriteCareGivers,
               selectedSpecialty: $selectedSpecialty,
               searchText: $searchText
            )
            Text("Favoris")
               .font(.system(.title3, weight: .bold))
               .frame(maxWidth: .infinity, alignment: .leading)
               .padding(.leading, 10)
            List(filteredCareGivers) { caregiver in
               NavigationLink(destination: RendezVousView2(careGiver: caregiver)) {
                  HStack {
                     Image(caregiver.image)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                     VStack(alignment: .leading) {
                        Text(caregiver.name)
                           .font(.headline)
                        Text(caregiver.specialty)
                           .font(.subheadline)
                           .foregroundStyle(.gray)
                     }
                  }
               }
            }
         }
      }
      .searchable(text: $searchText, prompt: "rechercher une spécialité")
      .onChange(of: searchText) { oldValue, newValue in
         print("searchText changed to: \(newValue)")
         if newValue.isEmpty {
            resetCareGivers()
         } else {
            selectedSpecialty = nil
         }
      }
      .onChange(of: selectedSpecialty) { oldValue, newValue in
         print("selectedSpecialty changed to: \(String(describing: newValue))")
         if newValue == nil {
            searchText = ""
            favoriteCareGivers = FavoriteCareGiversData.careGivers
         }
      }
      .onSubmit(of: .search) {
         if searchText.isEmpty {
            resetCareGivers()
         }
      }
   }
}

#Preview {
   MainView()
}
