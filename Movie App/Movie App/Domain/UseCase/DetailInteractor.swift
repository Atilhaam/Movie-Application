//
//  DetailInteractor.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import Foundation
import RxSwift

protocol DetailUseCase {
    
    func getMovieDetail(id: String) -> Observable<MovieDetailModel>
    
    func getMovieReviews(id: String) -> Observable<[MovieReviewsModel]>
    
    func getMovieVideos(id: String) -> Observable<[MovieVideosModel]>

    
}

class DetailInteractor: DetailUseCase {
    
    private let repository: MovieDetailRepositoryProtocol
    
    required init(repository: MovieDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovieDetail(id: String) -> Observable<MovieDetailModel> {
        return repository.getMovieDetail(id: id)
    }
    
    func getMovieReviews(id: String) -> Observable<[MovieReviewsModel]> {
        return repository.getMovieReviews(id: id)
    }
    
    func getMovieVideos(id: String) -> Observable<[MovieVideosModel]> {
        return repository.getMovieVideos(id: id)
    }
    
    
}
