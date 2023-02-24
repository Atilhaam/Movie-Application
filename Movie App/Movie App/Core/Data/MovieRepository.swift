//
//  MovieRepository.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation
import RxSwift

protocol MovieRepositoryProtocol {
    
    func getMovies(page: Int) -> Observable<[MovieModel]>
    
}

final class MovieRepository: NSObject {
    
    typealias MovieInstance = (RemoteDataSource) -> MovieRepository
    fileprivate let remote: RemoteDataSource
    
    private init(remote: RemoteDataSource) {
        self.remote = remote
    }
    
    static let sharedInstance: MovieInstance = { remoteRepo in
        return MovieRepository(remote: remoteRepo)
    }
}

extension MovieRepository: MovieRepositoryProtocol {
    func getMovies(page: Int) -> Observable<[MovieModel]> {
        return self.remote.getMovies(page: page)
            .map { MovieMapper.mapMovieResponseToDomains(input: $0)}
    }
    
    
    
    
}
