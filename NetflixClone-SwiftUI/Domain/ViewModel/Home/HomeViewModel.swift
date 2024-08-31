//
//  HomeViewModel.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 31/08/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var nowShowing: [Movie] = []
    @Published var continueWatching: [Movie] = []
    @Published var search: String = ""
    @Published var currentIndex: Int = 1
    
    let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
    func getNowPlaying() async throws {
        do {
            let response = try await service.getNowPlaying(endpoint: .nowPlaying)
            let movies = response.results?.compactMap{
                $0.toMovie()
            } ?? []
            
            let maxMovie = max(movies.count - 1, 0)
            
            currentIndex = min(1, maxMovie)
            nowShowing = Array(movies.prefix(min(10, maxMovie)))
            continueWatching = Array(movies.prefix(min(4, maxMovie)))
        } catch {
            print(error.localizedDescription)
        }
    }
}
