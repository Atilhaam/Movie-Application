//
//  DetailViewController.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import UIKit
import RxSwift
import SDWebImage

class DetailViewController: UIViewController {
    let presenter: DetailPresenter
    private let disposeBag = DisposeBag()
    var detailMovies: MovieDetailModel? = nil
    var id: String = ""
    var movieReviews: [MovieReviewsModel] = []
    var movieVideos: [MovieVideosModel] = []

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailMovieTableViewCell.self, forCellReuseIdentifier: DetailMovieTableViewCell.identifier)
        tableView.register(DetailMovieSecondRowTableViewCell.self, forCellReuseIdentifier: DetailMovieSecondRowTableViewCell.identifier)
        tableView.register(DetailThirdRowTableViewCell.self, forCellReuseIdentifier: DetailThirdRowTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.presenter.getMovieDetail(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.detailMovies = result
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                self.tableView.reloadData()
            }.disposed(by: disposeBag)
        
        self.presenter.getMovieReviews(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.movieReviews = result
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                self.tableView.reloadData()
            }.disposed(by: disposeBag)
        
        self.presenter.getMovieVideos(id: id)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.movieVideos = result
            } onError: {  error in
                print(error.localizedDescription)
            } onCompleted: {
                self.tableView.reloadData()
            }.disposed(by: disposeBag)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Detail Movie"
        view.backgroundColor = .white
    }
    
    init(presenter: DetailPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32)
        ])
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailMovieTableViewCell.identifier) as! DetailMovieTableViewCell
            guard let detailMovies = self.detailMovies else {
                return cell
            }
            cell.titleLabel.text = detailMovies.title
            cell.imagePoster.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.imagePoster.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(detailMovies.poster)"))
            cell.overviewContent.text = detailMovies.overview
            cell.productionCompanyContent.text = detailMovies.productionCompany
            cell.releasedateContent.text = detailMovies.releaseDate
            cell.statusContent.text = detailMovies.status
            cell.genreContent.text = detailMovies.genres
            cell.voteAverageContent.text = "\(detailMovies.voteAverage) / 10"
            cell.productionCountriesContent.text = detailMovies.productionCountries
            cell.selectionStyle = .none
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailMovieSecondRowTableViewCell.identifier) as! DetailMovieSecondRowTableViewCell
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DetailThirdRowTableViewCell.identifier) as! DetailThirdRowTableViewCell
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 1200
        } else if indexPath.row == 1 {
            return 100
        } else {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 1 {
            let userReviewVC = MovieUserReviewViewController()
            userReviewVC.movieReviews = self.movieReviews
            navigationController?.pushViewController(userReviewVC, animated: true)
        } else if indexPath.row == 2 {
            let movieVideoVc = MovieVideosViewController()
            movieVideoVc.movieVideos = self.movieVideos
            navigationController?.pushViewController(movieVideoVc, animated: true)
        }
    }
}
