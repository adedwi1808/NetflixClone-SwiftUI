//
//  Movie.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import Foundation

struct Movie: Codable, Hashable, Identifiable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
}

var moviesDummy = [
    Movie(adult: false, backdropPath: "https://m.media-amazon.com/images/I/71uKM+LdgFL.jpg", genreIDS: [28, 12, 878], id: 27205, originalLanguage: "en", originalTitle: "Inception", overview: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.", popularity: 82.939, posterPath: "https://m.media-amazon.com/images/I/71uKM+LdgFL.jpg", releaseDate: "2010-07-15", title: "Inception", video: false, voteAverage: 8.3, voteCount: 29000),
    Movie(adult: false, backdropPath: "https://m.media-amazon.com/images/I/81CLFQwU-WL._AC_UF894,1000_QL80_.jpg", genreIDS: [28, 80, 18], id: 155, originalLanguage: "en", originalTitle: "The Dark Knight", overview: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.", popularity: 87.453, posterPath: "https://m.media-amazon.com/images/I/81CLFQwU-WL._AC_UF894,1000_QL80_.jpg", releaseDate: "2008-07-16", title: "The Dark Knight", video: false, voteAverage: 8.4, voteCount: 26000),
    Movie(adult: false, backdropPath: "https://m.media-amazon.com/images/I/71JC2qvPx5L._AC_UF894,1000_QL80_.jpg", genreIDS: [12, 18, 878], id: 157336, originalLanguage: "en", originalTitle: "Interstellar", overview: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", popularity: 78.852, posterPath: "https://m.media-amazon.com/images/I/71JC2qvPx5L._AC_UF894,1000_QL80_.jpg", releaseDate: "2014-11-05", title: "Interstellar", video: false, voteAverage: 8.3, voteCount: 21000)
]
