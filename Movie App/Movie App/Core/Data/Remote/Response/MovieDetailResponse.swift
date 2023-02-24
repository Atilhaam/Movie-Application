//
//  MovieDetailResponse.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation

struct MovieDetailResponse: Decodable {
    let id: Int?
    let title: String?
    let overview: String?
    let poster: String?
    let productionCompany: [ProductionCompany]?
    let status: String?
    let releaseDate: String?
    let genres: [Genres]?
    let voteAverage: Double?
    let productionCountries: [ProductionCountries]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case overview
        case poster = "poster_path"
        case productionCompany = "production_companies"
        case status
        case releaseDate = "release_date"
        case genres
        case voteAverage = "vote_average"
        case productionCountries = "production_countries"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        poster = try container.decodeIfPresent(String.self, forKey: .poster)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        productionCompany = try container.decodeIfPresent([ProductionCompany].self, forKey: .productionCompany)
        status = try container.decodeIfPresent(String.self, forKey: .status)
        genres = try container.decodeIfPresent([Genres].self, forKey: .genres)
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
        productionCountries = try container.decodeIfPresent([ProductionCountries].self, forKey: .productionCountries)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    }
}

struct ProductionCompany: Decodable {
    let id: Int
    let name: String
    let origin: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case origin = "origin_country"
    }
    
}

struct Genres: Decodable {
    let name: String
    
}

struct ProductionCountries: Decodable {
    let name: String
}

struct MoviesUserReviewResponse: Decodable {
    let id: Int
    let reviews: [MovieUserReviewResponse]
    
    enum CodingKeys: String, CodingKey {
        case id
        case reviews = "results"
    }
}

struct MovieUserReviewResponse: Decodable {
    let id: String
    let author: String
    let content: String
    let authorDetails: AuthorDetails
    
    enum CodingKeys: String, CodingKey {
        case id
        case author
        case content
        case authorDetails = "author_details"
    }
}

struct AuthorDetails: Decodable {
    let username: String
    
    enum CodingKeys: String, CodingKey {
        case username

    }
    
}

struct MoviesVideoResponse: Decodable {
    let id: Int
    let results: [MovieVideoResponse]
}

struct MovieVideoResponse: Decodable {
    let id: String
    let name: String
    let site: String
    let key: String
    let type: String
    let publishedDate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case site
        case key
        case type
        case publishedDate = "published_at"
    }
    
}
