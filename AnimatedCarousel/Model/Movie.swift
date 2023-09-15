//
//  Movie.swift
//  AnimatedCarousel
//
//

import SwiftUI

struct Movie: Identifiable,Equatable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork: String
}

var movies: [Movie] = [
    Movie(movieTitle: "", artwork: "BG2"),
    Movie(movieTitle: "", artwork: "BG1"),
    Movie(movieTitle: "", artwork: "BG4"),
    Movie(movieTitle: "", artwork: "BG3"),
    
]
