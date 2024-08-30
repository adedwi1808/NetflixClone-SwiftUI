//
//  NowShowingView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct NowShowingView: View {
    @Binding var currentIndex: Int
    var body: some View {
        Text("**Now** Showing")
            .foregroundStyle(.white)
            .font(.system(.title2))
        
        VStack {
            SnapCarousel(
                spacing: 20,
                trailingSpace: 180,
                index: $currentIndex,
                list: moviesDummy
            ) { movie in
                VStack(spacing: 10) {
                    GeometryReader { proxy in
                        AsyncImage(url: URL(string: movie.movieBanner)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.gray)
                                .padding(18)
                        }
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height
                        )
                        .background(.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 26))
                    }
                    .frame(height: 240)
                }
            }
            .frame(maxHeight: 250)
            
            HStack(spacing: 4) {
                ForEach(0..<moviesDummy.count) { index in
                    Button {
                        
                    } label: {
                        Circle()
                            .fill(currentIndex == index ? .white : .gray.opacity(0.3))
                            .frame(width: 10)
                    }
                }
            }
        }
    }
}

#Preview {
    NowShowingView(currentIndex: .constant(0))
}
