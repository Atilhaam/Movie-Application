//
//  MovieMapper.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation

final class MovieMapper {
    
    static func mapMovieResponseToDomains(input movieResponse: [MovieResponse]) -> [MovieModel] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return movieResponse.map { result in
            return MovieModel(
                id: String(result.id ?? 0),
                title: result.title ?? "",
                backgroundImage: result.backgroundImage ?? "",
                overview: result.overview ?? "",
                releaseDate: dateFormatter.string(from: result.releaseDate!),
                voteRating: String(result.voteRating ?? 0))
        }
    }
    
    static func mapMovieDetailResponseToDomains(input movieDetailResponse: MovieDetailResponse) -> MovieDetailModel {
        let productionCompanies = movieDetailResponse.productionCompany?.map({ $0.name }).joined(separator: ", ")
        let productionCountries = movieDetailResponse.productionCountries?.map({ $0.name }).joined(separator: ", ")
        let genres = movieDetailResponse.genres?.map({ $0.name }).joined(separator: ", ")
        
        return MovieDetailModel(
            id: String(movieDetailResponse.id ?? 0),
            title: movieDetailResponse.title ?? "",
            overview: movieDetailResponse.overview ?? "",
            poster: movieDetailResponse.poster ?? "",
            productionCompany: productionCompanies ?? "",
            status: movieDetailResponse.status ?? "",
            releaseDate: movieDetailResponse.releaseDate ?? "",
            runtime:  "",
            genres:  genres ?? "",
            voteAverage: String(movieDetailResponse.voteAverage ?? 0),
            productionCountries:  productionCountries ?? ""
        )
    }
    
    static func mapMovieReviewsResponseToDomains(input movieReviewsResponse: [MovieUserReviewResponse]) -> [MovieReviewsModel] {
        return movieReviewsResponse.map { result in
            return MovieReviewsModel(
                id: result.id,
                authorName: result.author,
                content: result.content,
                userName: result.authorDetails.username,
                avatarpath: "",
                rating: "")
        }
    }
    
    static func mapMovieVideosResponseToDomains(input movieVideosResponse: [MovieVideoResponse]) -> [MovieVideosModel] {
        return movieVideosResponse.map { result in
            return MovieVideosModel(
                id: result.id,
                name: result.name,
                site: result.site,
                key: result.key,
                type: result.type,
                publishedDate: result.publishedDate)
        }
        
    }
    
    
}
