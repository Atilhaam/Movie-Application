//
//  MovieDetailRepository.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import Foundation
import RxSwift

protocol MovieDetailRepositoryProtocol {
    
    func getMovieDetail(id: String) -> Observable<MovieDetailModel>
    
    func getMovieReviews(id: String) -> Observable<[MovieReviewsModel]>
    
    func getMovieVideos(id: String) -> Observable<[MovieVideosModel]>
    
}

final class MovieDetailRepository: NSObject {
    
    typealias MovieInstance = (RemoteDataSource) -> MovieDetailRepository
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: MovieInstance = { remoteRepo in
        return MovieDetailRepository(remote: remoteRepo)
    }
}

extension MovieDetailRepository: MovieDetailRepositoryProtocol {
    
    func getMovieReviews(id: String) -> Observable<[MovieReviewsModel]> {
        return self.remote.getMovieReviews(id: id)
            .map { MovieMapper.mapMovieReviewsResponseToDomains(input: $0)}
    }
    
    func getMovieDetail(id: String) -> Observable<MovieDetailModel> {
        return self.remote.getMovieDetail(id: id)
            .map { MovieMapper.mapMovieDetailResponseToDomains(input: $0)}
    }
    
    func getMovieVideos(id: String) -> Observable<[MovieVideosModel]> {
        return self.remote.getMovieVideos(id: id)
            .map { MovieMapper.mapMovieVideosResponseToDomains(input: $0)}
    }
    
    
}
