//
//  MovieResponse.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation

struct MoviesResponse: Decodable {
    let movies: [MovieResponse]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct MovieResponse: Decodable {
    let id: Int?
    let title: String?
    let backgroundImage: String?
    let overview: String?
    let releaseDate: Date?
    let voteRating: Double?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case backgroundImage = "poster_path"
        case overview
        case releaseDate = "release_date"
        case voteRating = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dateString = try container.decode(String.self, forKey: .releaseDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateString)!
        
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        backgroundImage = try container.decodeIfPresent(String.self, forKey: .backgroundImage)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
        voteRating = try container.decodeIfPresent(Double.self, forKey: .voteRating)
        releaseDate = date
    }
    
}
