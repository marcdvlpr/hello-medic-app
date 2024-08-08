//
//  SearchSpecialistView.swift
//  DeboguaggeFavorisView
//
//  Created by Apprenant 125 on 08/08/2024.
//

import SwiftUI

struct SearchSpecialistView: View {

    @State private var searchSpecialties = ""
    @StateObject private var careGiverslist = SpecialistsDataList()

    var body: some View {

        NavigationStack {
            HStack {
                Text("Favoris")
                    .font(.headline)
                    .padding()
                Spacer()
            }.padding(-10)

            // début de la scrollView à remplacer
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<5, id: \.self) { index in
                        NumberView1to5(label: "\(index + 1)")
                            .foregroundStyle(.white)
                            .bold()
                    }
                }
            }.padding()
            // fin de la scrollView à remplacer

            List {
                ForEach(careGiverslist.filteredCareGivers) { careGiver in
                    NavigationLink {
                        Text(careGiver.name)
                        DocumentDetailView()                             // écran de test
                    } label: {
                        HStack(alignment: .center) {
                            HStack(alignment: .center) {
                                Image(careGiver.pictName)
                                    .resizable()
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .padding()

                                VStack(alignment: .leading) {
                                    Text(careGiver.name)
                                        .font(.headline)
                                    Text(careGiver.specialty)
                                        .font(.subheadline)
                                }
                                Spacer()
                            }
                        }
                        .shadow(radius: 2)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favoris")
            .searchable(text: $careGiverslist.searchSpecialties, prompt: "Rechercher une spécialité")
        }
    }
}

#Preview {
    SearchSpecialistView()
}

struct NumberView1to5: View {
    let label: String

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.orange)
                .frame(width: 75, height: 75)
            Text(label)
        }
    }
}
