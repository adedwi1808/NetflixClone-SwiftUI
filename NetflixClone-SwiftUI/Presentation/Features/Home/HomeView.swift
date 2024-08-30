//
//  HomeView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct HomeView: View {
    @State var search: String = ""
    @State var currentIndex: Int = 0
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                HomeHeaderView()
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    
                    TextField("",
                              text: $search,
                              prompt: {
                        Text("Search Movie")
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
                
                Text("**Now** Showing")
                    .foregroundStyle(.white)
                    .font(.system(.title2))
                
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
                                    .scaledToFill()
                            }
                            .frame(
                                width: proxy.size.width,
                                height: proxy.size.height
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 26))
                        }
                        .frame(height: 240)
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: UIScreen.height, alignment: .top)
        }
        .background(.cetaceanBlue)
    }
}

#Preview {
    HomeView()
}

struct HomeHeaderView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            AsyncImage(url: URL(string: "https://media.licdn.com/dms/image/v2/C4E03AQGw3Zn6ZkGoMA/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1629262195284?e=1730332800&v=beta&t=Tg7Ko2pE2ZUEFY4_aJawE1SRVDs9Y22iVZitPZZyi-0")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
                    .tint(.white)
                    .padding(16)
            }
            .clipShape(Circle())
            .background {
                Circle()
                    .fill(.gray.opacity(0.3))
            }
            .frame(width: 50, height: 50)
            
            
            VStack(alignment: .leading, spacing: 2) {
                Text("**Hello** Ade 👋🏻")
                    .font(.system(.title3, weight: .thin))
                    .foregroundStyle(.white)
                
                Text("Enjoy yout favorite movie")
                    .font(.system(.caption, weight: .thin))
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            Button {
                //
            } label: {
                Image(systemName: "bell.badge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .foregroundStyle(.red, .white)
                    .padding(16)
                    .background {
                        Circle()
                            .fill(.gray.opacity(0.3))
                    }
            }
            
        }
    }
}
