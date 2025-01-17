//
//  ContentView.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var navigationManager: NavigationManager = NavigationManager()
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            LoginView()
                .environmentObject(navigationManager)
                .navigationDestination(for: Route.self) {
                    navigationManager.RoutesDestination(selectedRoutes: $0)
                        .navigationBarBackButtonHidden()
                }
        }
    }
}

#Preview {
    ContentView()
}
