//
//  DetailReviewViewController.swift
//  Movie App
//
//  Created by Ilham Wibowo on 24/02/23.
//

import UIKit
import SDWebImage

class DetailReviewViewController: UIViewController {
    
    var movieReviews: MovieReviewsModel? = nil
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(DetailReviewTableViewCell.self, forCellReuseIdentifier: DetailReviewTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
extension DetailReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailReviewTableViewCell.identifier) as! DetailReviewTableViewCell
        cell.isUserInteractionEnabled = false
        cell.userNameContent.text = movieReviews?.userName
        cell.authorNameContent.text = movieReviews?.authorName
        cell.overviewContent.text = movieReviews?.content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 1700
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            tableView.deselectRow(at: indexPath, animated: true)

        }
    }
    
}
