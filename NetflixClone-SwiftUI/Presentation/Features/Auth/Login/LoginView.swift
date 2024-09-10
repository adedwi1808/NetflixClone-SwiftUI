//
//  LoginView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 10/09/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var navigationManager: NavigationManager
    var body: some View {
        ZStack {
            BackgroundView()
            
            ContentView()
                .padding(16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cetaceanBlue)
    }
}

#Preview {
    LoginView()
}

extension LoginView {
    private func getGradient(isTop: Bool = false) -> LinearGradient {
        return LinearGradient(
            gradient: Gradient(
                stops: [
                    Gradient.Stop(
                        color: .clear,
                    location: 0
                ),
                    Gradient.Stop(
                        color: .cetaceanBlue,
                        location: 0.2
                ),
                ]
            ),
            startPoint: isTop ? .top : .bottom,
            endPoint: isTop ? .bottom : .top
        )
    }
    
    @ViewBuilder
    private func BackgroundView() -> some View {
        Image(.jujutsuPoster)
            .resizable()
            .scaledToFit()
            .mask(getGradient(isTop: true))
            .mask(getGradient())
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    @ViewBuilder
    private func ContentView() -> some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            
            Text("Watch your favorite movie or series on only one platform. You can watch it anytime and anywhere")
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
            Button {
                navigationManager.navigateTo(.home)
            } label: {
                Text("Sign In")
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
            }
            .buttonStyle(
                CustomBorderedButton(
                    backgroundColor: .pictonBlue
                )
            )
            
            Button {
                navigationManager.navigateTo(.home)
            } label: {
                HStack(alignment: .center, spacing: 10) {
                    Image(.icGoogle)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                    
                    Text("Continue With Google")
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                }
            }
            .buttonStyle(
                CustomBorderedButton(
                    backgroundColor: .clear,
                    borderWidth: 2
                )
            )
        }
    }
}
