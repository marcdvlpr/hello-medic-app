//
//  RowEditProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 05/08/2024.
//

import SwiftUI

struct RowEditProfileView: View {
    let title: String
    
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(title)
            Spacer()
            TextField("", text: $text)
                .foregroundStyle(Color(.systemGray))
                .textFieldStyle(.plain)
                .multilineTextAlignment(.trailing)
        }
    }
}

#Preview {
    RowEditProfileView(title: "Prénom", text: .constant("John"))
}
