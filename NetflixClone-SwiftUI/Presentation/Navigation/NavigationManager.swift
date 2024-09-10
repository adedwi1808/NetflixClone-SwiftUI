//
//  NavigationManager.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import SwiftUI


class NavigationManager: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    func goToRoot() {
        guard !path.isEmpty else { return }
        path.removeLast(path.count)
    }
    
    func navigateTo(_ destination: Route) {
        path.append(destination)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
}

extension NavigationManager {
    @ViewBuilder
    func RoutesDestination(selectedRoutes: Route) -> some View {
        switch selectedRoutes {
        case .home:
            HomeView()
        default:
            EmptyView()
        }
    }
}

enum Route: Hashable {
    case home
}
