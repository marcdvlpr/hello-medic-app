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
            HomeView()
                .tabItem {
                    Image(systemName: Tab.home.rawValue)
                    Text("Accueil")
                }
                .tag(Tab.home)
            
            AppointmentView()
                .tabItem {
                    Image(systemName: Tab.appointment.rawValue)
                    Text("Rendez-vous")
                }
                .tag(Tab.appointment)
            
           MainView()

             .tabItem {
                    Image(systemName: Tab.favorite.rawValue)
                    Text("Favoris")
                }
                .tag(Tab.favorite)
            
            UserProfileView()
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
