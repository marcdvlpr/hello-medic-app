//
//  ViewCoordinator.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 26/07/2024.
//

import SwiftUI

struct ViewCoordinator: View {
    
    @State private var isActive = false
    
    var body: some View {
        
        if isActive {
            ContentView()
        }
        else {
            SplashView(isActive: $isActive)
        }
    }
}

#Preview {
    ViewCoordinator()
}
