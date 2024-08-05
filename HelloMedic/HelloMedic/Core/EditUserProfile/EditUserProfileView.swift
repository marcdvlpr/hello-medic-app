//
//  EditProfileView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 05/08/2024.
//

import SwiftUI

struct EditProfileView: View {
    
    @State private var firstName: String = ""
    
    var body: some View {
        VStack {
            List {
                Section("Information Personnelle ") {
                    HStack(spacing: 10) {
                        Text("Prénoms")
                        Spacer()
                        TextField("John", text: $firstName)
                            .textFieldStyle(.plain)
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
