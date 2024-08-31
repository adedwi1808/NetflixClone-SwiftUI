//
//  HomeView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct HomeView: View {
    @State var search: String = ""
    @State var currentIndex: Int = 1
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                HomeHeaderView()
                
                SearchBar(text: $search, placeholder: "Search Movie")
                
                NowShowingView(currentIndex: $currentIndex)
                
                ContinueWatchingView()
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
