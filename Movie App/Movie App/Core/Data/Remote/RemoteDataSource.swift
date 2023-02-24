//
//  RemoteDataSource.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol: AnyObject {
    func getMovies(page: Int) -> Observable<[MovieResponse]>
}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    func getMovies(page: Int) -> Observable<[MovieResponse]> {
        API.page = "\(page)"
        return Observable<[MovieResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.movies.url) {
                print(url)
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            print("berhasil")
                            observer.onNext(value.movies)
                            print(value.movies)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getMovieDetail(id: String) -> Observable<MovieDetailResponse> {
        API.idMovie = id
        return Observable<MovieDetailResponse>.create { observer in
            if let url = URL(string: Endpoints.Gets.detailMovie.url) {
                print(url)
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MovieDetailResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                            print("error di alamofire")
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getMovieReviews(id: String) -> Observable<[MovieUserReviewResponse]> {
        return Observable<[MovieUserReviewResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.detailMovieReviews.url) {
                print(url)
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesUserReviewResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            print("berhasil")
                            observer.onNext(value.reviews)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
        
    }
    
    func getMovieVideos(id: String) -> Observable<[MovieVideoResponse]> {
        return Observable<[MovieVideoResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.movieVideos.url) {
                print(url)
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MoviesVideoResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            print("berhasil")
                            observer.onNext(value.results)
                            observer.onCompleted()
                        case.failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    
}
