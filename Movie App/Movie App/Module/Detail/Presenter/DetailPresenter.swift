//
//  DetailPresenter.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import Foundation
import RxSwift

class DetailPresenter: ObservableObject {
    private let detailUseCase: DetailUseCase
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func getMovieDetail(id: String) -> Observable<MovieDetailModel> {
        return detailUseCase.getMovieDetail(id: id)
    }
    
    func getMovieReviews(id: String) -> Observable<[MovieReviewsModel]> {
        return detailUseCase.getMovieReviews(id: id)
    }
    
    func getMovieVideos(id: String) -> Observable<[MovieVideosModel]> {
        return detailUseCase.getMovieVideos(id: id)
    }


}
