//
//  MovieModel.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation

struct MovieModel: Equatable, Identifiable {
    let id: String
    let title: String
    let backgroundImage: String
    let overview: String
    let releaseDate: String
    let voteRating: String
}
