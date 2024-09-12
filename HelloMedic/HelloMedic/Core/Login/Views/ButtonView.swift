//
//  ButtonView.swift
//  HelloMedic
//
//  Created by Apprenant 125 on 01/08/2024.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        HStack {
            Text("Se connecter")
                .foregroundStyle(.white)
                .bold()
                .padding()
                .frame(maxWidth: .infinity)
                .background(.hmBlue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    ButtonView()
}
