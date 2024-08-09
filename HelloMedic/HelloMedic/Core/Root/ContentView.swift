//
//  ContentView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 18/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            LoginView()
        } else {
            SplashView(isActive: $isActive)
        }
    }
}

#Preview {
    ContentView()
}
