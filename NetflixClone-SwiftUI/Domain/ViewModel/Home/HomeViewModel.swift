//
//  HomeViewModel.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 31/08/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var search: String = ""
    @Published var currentIndex: Int = 1
    
    let service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol = HomeService()) {
        self.service = service
    }
    
    func getNowPlaying() async throws {
        do {
            let response = try await service.getNowPlaying(endpoint: .nowPlaying)
            movies = response.results?.compactMap{
                $0.toMovie()
            } ?? []
            print(movies.first)
        } catch {
            print(error.localizedDescription)
        }
    }
}
