//
//  HomeInteractor.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation
import RxSwift

protocol HomeUseCase {
    
    func getMovies(page: Int) -> Observable<[MovieModel]>
    
}

class HomeInteractor: HomeUseCase {
    
    private let repository: MovieRepositoryProtocol
    
    required init(repository: MovieRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovies(page: Int) -> Observable<[MovieModel]> {
        return repository.getMovies(page: page)
    }
}
