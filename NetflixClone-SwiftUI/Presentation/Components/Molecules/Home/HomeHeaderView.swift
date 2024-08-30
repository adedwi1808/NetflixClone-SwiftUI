//
//  HomeHeaderView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

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

#Preview {
    HomeHeaderView()
}
