//
//  SplashView.swift
//  HelloMedic
//
//  Created by Apprenant 172 on 19/07/2024.
//

import SwiftUI

struct SplashView: View {
    
    @State private var scale = 0.7
    @Binding var isActive: Bool
    
    var body: some View {
        
        VStack {
            // Texte HelloDoc avec la police personnalisée
            Text("HelloDoc")
                .font(Font.custom("Baloo-Regular", size: 64))
                .foregroundColor(Color("hmBlue"))
            
            // Image du logo avec une animation de mise à l'échelle
            Image("hmLogo")
                .resizable()
                .frame(width: 280, height: 280)
                .scaledToFit()
                .scaleEffect(scale)
                .onAppear{
                    withAnimation(.easeIn(duration: 2)) {
                        self.scale = 1.2
                    }
                }
            
            // Changer l'état après un délai de 3,5 secondes
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        
    }
}

#Preview {
    SplashView(isActive: .constant(false))
}
