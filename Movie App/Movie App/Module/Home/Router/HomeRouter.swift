//
//  HomeRouter.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import Foundation
import UIKit

class HomeRouter {
    func moveToDetail(navigationController: UINavigationController?, id: String) {
        let detailUseCase = Injection.init().provideDetail()
        let detailPresenter = DetailPresenter(detailUseCase: detailUseCase)
        let detailVc = DetailViewController(presenter: detailPresenter)
        detailVc.id = id
        navigationController?.pushViewController(detailVc, animated: true)
    }
}
