//
//  SearchBar.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    let placeholder: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.gray)
            
            TextField(placeholder,
                      text: $text,
                      prompt: {
                Text(placeholder)
                    .foregroundStyle(.gray)
            }())
            .foregroundStyle(.white)
            
            Button {
                //
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundStyle(.gray)
            }
        }
        .padding(13)
        .frame(maxWidth: .infinity)
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.gray.opacity(0.3))
        }
    }
}

#Preview {
    SearchBar(text: .constant(""), placeholder: "Search Movie")
}
