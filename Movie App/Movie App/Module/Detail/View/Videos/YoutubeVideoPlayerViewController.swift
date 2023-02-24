//
//  YoutubeVideoPlayerViewController.swift
//  Movie App
//
//  Created by Ilham Wibowo on 24/02/23.
//

import UIKit
import youtube_ios_player_helper

class YoutubeVideoPlayerViewController: UIViewController {
    
    let playerView = YTPlayerView()
    var id = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        playerView.load(withVideoId: id)

    }
    
    private func setupView() {
        playerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerView)

        // Add constraints to the player view
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}
