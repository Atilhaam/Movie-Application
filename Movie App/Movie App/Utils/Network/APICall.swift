//
//  APICall.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation

struct API {

    static let baseUrlMovies = "https://api.themoviedb.org/3/movie/popular"
    static let baseUrlMovieDetail = "https://api.themoviedb.org/3/movie"
    static let baseMovie = "https://api.themoviedb.org/3/movie/505642/videos?api_key=7a0390056fc89dd647a1702177f5adab&language=en-US"
    static var idMovie = ""
    static var page = ""
    
}

protocol Endpoint {
    var url: String { get }
}

enum Endpoints {
    enum Gets: Endpoint {
        case movies
        case detailMovie
        case detailMovieReviews
        case movieVideos
        
        public var url: String {
            switch self {
            case .movies: return "\(API.baseUrlMovies)?api_key=7a0390056fc89dd647a1702177f5adab&language=en-US&page=\(API.page)"
            case .detailMovie: return "\(API.baseUrlMovieDetail)/\(API.idMovie)?api_key=7a0390056fc89dd647a1702177f5adab&language=en-US"
            case .detailMovieReviews: return
                "\(API.baseUrlMovieDetail)/\(API.idMovie)/reviews?api_key=7a0390056fc89dd647a1702177f5adab&language=en-US&page=1"
            case .movieVideos: return
                "\(API.baseUrlMovieDetail)/\(API.idMovie)/videos?api_key=7a0390056fc89dd647a1702177f5adab&language=en-US"
            }
        }
    }
    
}
