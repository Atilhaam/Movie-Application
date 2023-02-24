//
//  HomePresenter.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation
import RxSwift

class HomePresenter: ObservableObject {
    private let homeUseCase: HomeUseCase
    
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    
    func getMovies(page: Int) -> Observable<[MovieModel]> {
        return homeUseCase.getMovies(page: page)
    }
    
}
