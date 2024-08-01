//
//  LogoViewComponent.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 01/08/2024.
//

import SwiftUI

struct LogoViewComponent: View {
    var body: some View {
        Image("hmLogo")
            .resizable()
            .scaledToFit()
            .frame(height: 300)
    }
}

#Preview {
    LogoViewComponent()
}
