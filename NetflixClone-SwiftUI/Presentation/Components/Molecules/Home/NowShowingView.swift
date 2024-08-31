//
//  NowShowingView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct NowShowingView: View {
    @Binding var currentIndex: Int
    let movies: [Movie]
    
    init(currentIndex: Binding<Int>, movies: [Movie]) {
        self._currentIndex = currentIndex
        self.movies = Array(movies.prefix(min(5, movies.count)))
    }
    
    var body: some View {
        Text("**Now** Showing")
            .foregroundStyle(.white)
            .font(.system(.title2))
        
        VStack {
            SnapCarousel(
                spacing: 20,
                trailingSpace: 180,
                index: $currentIndex,
                list: movies
            ) { movie in
                VStack(spacing: 10) {
                    GeometryReader { proxy in
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + movie.posterPath)) { image in
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
                ForEach(0..<movies.count) { index in
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
    NowShowingView(currentIndex: .constant(0), movies: moviesDummy)
}
