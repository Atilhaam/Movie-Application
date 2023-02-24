//
//  Injection.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import Foundation

final class Injection: NSObject {
    private func provideRepository() -> MovieRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        return MovieRepository.sharedInstance(remote)
    }
    
    private func provideDetailRepository() -> MovieDetailRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        return MovieDetailRepository.sharedInstance(remote)
    }
    
    func provideHome() -> HomeUseCase {
        let repository = provideRepository()
        return HomeInteractor(repository: repository)
    }
    
    func provideDetail() -> DetailUseCase {
        let repository = provideDetailRepository()
        return DetailInteractor(repository: repository)
        
    }
    
    
}
