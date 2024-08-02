//
//  RowProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 02/08/2024.
//

import SwiftUI

struct RowProfileView: View {
    let title: String
    let value: String?
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value ?? "")
                .foregroundStyle(Color(.systemGray))
        }
    }
}

#Preview {
    RowProfileView(title: "First Name", value: "John")
}
