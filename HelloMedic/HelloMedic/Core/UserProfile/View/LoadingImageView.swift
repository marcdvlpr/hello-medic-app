//
//  LoadingImageView.swift
//  HelloMedic
//
//  Created by Apprenant 124 on 09/08/2024.
//

import SwiftUI

struct LoadingImageView: View {
    let url: URL?
    let initials: String?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(.hmBlue, lineWidth: 4))
        } placeholder: {
            Text(initials ?? "")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 100, height: 100)
                .background(Color(.systemGray2))
                .clipShape(Circle())
        }
    }
}

#Preview {
    LoadingImageView(url: URL(string: "https://i.pravatar.cc/300?img=12"), initials: "JD")
}
