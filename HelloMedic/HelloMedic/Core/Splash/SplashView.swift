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
            Text("HelloDoc")
                .font(Font.custom("Baloo2", size: 64, relativeTo: .title))
                .foregroundColor(Color("hmBlue"))
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
