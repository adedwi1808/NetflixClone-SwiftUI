//
//  HomeView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                HomeHeaderView()
                
                SearchBar(text: $vm.search, placeholder: "Search Movie")
                
                NowShowingView(currentIndex: $vm.currentIndex, movies: vm.movies)
                
                ContinueWatchingView()
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, minHeight: UIScreen.height, alignment: .top)
        }
        .background(.cetaceanBlue)
        .onAppear {
            Task {
                try await vm.getNowPlaying()
            }
        }
    }
}

#Preview {
    HomeView()
}
