//
//  Movie.swift
//  NetflixClone-SwiftUI
//
//  Created by Ade Dwi Prayitno on 30/08/24.
//

import Foundation

struct Movie: Identifiable {
    var id: String = UUID().uuidString
    var movieBanner: String
    var title: String
    var description: String
    var starRating: Int
}

var moviesDummy = [
    Movie(movieBanner: "https://m.media-amazon.com/images/I/71uKM+LdgFL.jpg", title: "Inception", description: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.", starRating: 5),
    Movie(movieBanner: "https://m.media-amazon.com/images/I/81CLFQwU-WL._AC_UF894,1000_QL80_.jpg", title: "The Dark Knight", description: "When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.", starRating: 5),
    Movie(movieBanner: "https://m.media-amazon.com/images/I/71JC2qvPx5L._AC_UF894,1000_QL80_.jpg", title: "Interstellar", description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.", starRating: 5)
]

