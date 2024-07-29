//
//  TabBarView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 19/07/2024.
//

import SwiftUI

enum Tab: String {
    case home = "house"
    case appointment = "calendar"
    case favorite = "bookmark"
    case profile = "person"
}

struct TabBarView: View {
    @State private var selectedTab: Tab = .home
     
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home Screen")
                .tabItem {
                    Image(systemName: Tab.home.rawValue)
                    Text("Accueil")
                }
                .tag(Tab.home)
            
            Text("Appointment Screen")
                .tabItem {
                    Image(systemName: Tab.appointment.rawValue)
                    Text("Rendez-vous")
                }
                .tag(Tab.appointment)
            
            Text("Favorite Screen")
                .tabItem {
                    Image(systemName: Tab.favorite.rawValue)
                    Text("Favoris")
                }
                .tag(Tab.favorite)
            
            Text("Profile Screen")
                .tabItem {
                    Image(systemName: Tab.profile.rawValue)
                    Text("Profil")
                }
                .tag(Tab.profile)
        }
        .tint(.hmBlue)
    }
}

#Preview {
    TabBarView()
}