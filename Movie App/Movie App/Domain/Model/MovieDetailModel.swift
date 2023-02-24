//
//  MovieDetailModel.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import Foundation

struct MovieDetailModel: Equatable, Identifiable {
    let id: String
    let title: String
    let overview: String
    let poster: String
    let productionCompany: String
    let status: String
    let releaseDate: String
    let runtime: String
    let genres: String
    let voteAverage: String
    let productionCountries: String
}

struct MovieReviewsModel: Equatable, Identifiable {
    let id: String
    let authorName: String
    let content: String
    let userName: String
    let avatarpath: String
    let rating: String
    
}

struct MovieVideosModel: Equatable, Identifiable {
    let id: String
    let name: String
    let site: String
    let key: String
    let type: String
    let publishedDate: String
}
