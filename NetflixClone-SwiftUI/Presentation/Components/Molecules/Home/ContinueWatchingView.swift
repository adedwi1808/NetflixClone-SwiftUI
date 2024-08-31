//
//  ContinueWatchingView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 31/08/24.
//

import SwiftUI

struct ContinueWatchingView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Continue Watching")
                    .font(.system(.title3))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("View More")
                        .font(.system(.caption))
                        .foregroundStyle(.gray)
                }
            }
            
            VStack(spacing: 12) {
                ForEach(moviesDummy) { movie in
                    CellView(data: movie)
                }
            }
            
        }
    }
}

#Preview {
    ContinueWatchingView()
        .background(.cetaceanBlue)
}

fileprivate struct CellView: View  {
    let data: Movie
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + data.posterPath)) { image in
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
            .frame(width: 60, height: 60)
            .background(.gray.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading) {
                Text(data.title)
                    .foregroundStyle(.white)
                Text(data.overview.prefix(12) + "...")
                    .foregroundStyle(.gray)
            }
            .font(.system(.title3))
            
            Spacer()
            
            MovieProgressButtonView(progress: CGFloat.random(in: 0...0.9)) {
                
            }
                .frame(width: 40, height: 40)
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(.gray.opacity(0.2))
        }
    }
}

fileprivate struct MovieProgressButtonView: View {
    let progress: CGFloat
    let callback: () -> Void
    
    var body: some View {
        Button {
            callback()
        } label: {
            content()
        }
    }
    
    @ViewBuilder
    func content() -> some View {
        ZStack(alignment: .center) {
            Circle()
                .fill(.cetaceanBlue)
            
            Circle()
                .stroke(lineWidth: 3)
                .opacity(0.4)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: min(progress, 1.0))
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .foregroundColor(.gray)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: progress)
            
            Image(systemName: "play.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 12)
                .foregroundStyle(.white)
                .opacity(0.9)
        }
    }
}
