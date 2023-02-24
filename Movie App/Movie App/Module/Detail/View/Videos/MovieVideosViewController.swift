//
//  MovieVideosViewController.swift
//  Movie App
//
//  Created by Ilham Wibowo on 24/02/23.
//

import UIKit

class MovieVideosViewController: UIViewController {
    
    var movieVideos: [MovieVideosModel] = []

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MovieVideoTableViewCell.self, forCellReuseIdentifier: MovieVideoTableViewCell.identifier)
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
    
    func formatDate(_ dateString: String) -> String? {
        let dateFormatterInput = ISO8601DateFormatter()
        let dateFormatterOutput = DateFormatter()
        dateFormatterOutput.dateStyle = .medium
        dateFormatterOutput.timeStyle = .none
        guard let date = dateFormatterInput.date(from: dateString) else {
            return nil
        }
        return dateFormatterOutput.string(from: date)
    }
}
extension MovieVideosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieVideoTableViewCell.identifier) as! MovieVideoTableViewCell
        let reviews = self.movieVideos[indexPath.row]

        cell.videoSite.text = reviews.site
        cell.videoName.text = reviews.name
        cell.typeContent.text = reviews.type
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieVideos.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let id = self.movieVideos[indexPath.row].key
        let videoPlayerVC = YoutubeVideoPlayerViewController()
        videoPlayerVC.id = id
        self.navigationController?.pushViewController(videoPlayerVC, animated: true)
        videoPlayerVC.modalPresentationStyle = .fullScreen

    }
}
