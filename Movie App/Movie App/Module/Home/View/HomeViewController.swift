//
//  HomeViewController.swift
//  Movie App
//
//  Created by Ilham Wibowo on 22/02/23.
//

import UIKit
import SDWebImage
import RxSwift

class HomeViewController: UIViewController {
    
    var movies: [MovieModel] = []
    var isLoadingData = false
    var currentPage = 1
    private let disposeBag = DisposeBag()
    let presenter: HomePresenter
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let router = HomeRouter()
    
    init(presenter: HomePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        setUpCollectionView()
        self.presenter.getMovies(page: currentPage)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.movies = result
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                self.collectionView.reloadData()
            }.disposed(by: disposeBag)

        // Do any additional setup after loading the view.
    }
    
    private func setUpCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let id = self.movies[indexPath.row].id
        router.moveToDetail(navigationController: navigationController, id: id)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell {
            let movies = self.movies[indexPath.row]
            let ratingText = "\(movies.voteRating) / 10"
            cell.coverImage.sd_imageIndicator = SDWebImageActivityIndicator.white
            cell.coverImage.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movies.backgroundImage)"))
            cell.gameTitle.text = movies.title
            cell.releaseDateContent.text = movies.releaseDate
            cell.ratingContent.text = ratingText
            return cell
        } else {
            print("kosong")
            return UICollectionViewCell()
        }
    }
     
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - layout.minimumInteritemSpacing
        return CGSize(width: widthPerItem - 8, height: 250)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        if scrollOffset + scrollViewHeight >= scrollContentSizeHeight && !isLoadingData {
            currentPage += 1
            isLoadingData = true
            
            self.presenter.getMovies(page: currentPage)
                .observe(on: MainScheduler.instance)
                .subscribe { [weak self] result in
                    guard let self = self else { return }
                    // Append new data to existing movies array
                    self.movies += result
                    self.isLoadingData = false // Step 5
                    self.collectionView.reloadData()
                } onError: { error in
                    print(error.localizedDescription)
                }.disposed(by: disposeBag)
            
        }
        

    }
}
