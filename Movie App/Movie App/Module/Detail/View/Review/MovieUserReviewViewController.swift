//
//  MovieUserReviewViewController.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import UIKit
import SDWebImage

class MovieUserReviewViewController: UIViewController {
    
    var movieReviews: [MovieReviewsModel] = []

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieUserReviewsTableViewCell.self, forCellReuseIdentifier: MovieUserReviewsTableViewCell.identifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.rowHeight = 150
        tableView.dataSource = self
        tableView.delegate = self
    }

}
extension MovieUserReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieUserReviewsTableViewCell.identifier) as! MovieUserReviewsTableViewCell
        let reviews = self.movieReviews[indexPath.row]
        cell.authorName.text = "\(reviews.authorName)"
        cell.authorUsername.text = "\(reviews.userName)"
        cell.reviewContent.text = reviews.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieReviews.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailReviewVc = DetailReviewViewController()
        detailReviewVc.movieReviews = movieReviews[indexPath.row]
        navigationController?.pushViewController(detailReviewVc, animated: true)
    }
}
