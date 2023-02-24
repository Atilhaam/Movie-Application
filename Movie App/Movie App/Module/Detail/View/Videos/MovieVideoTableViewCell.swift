//
//  MovieVideoTableViewCell.swift
//  Movie App
//
//  Created by Ilham Wibowo on 24/02/23.
//

import UIKit

class MovieVideoTableViewCell: UITableViewCell {

    static let identifier = "MovieVideoTableViewCell"
    
    let videoName: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.textAlignment = .left
        return title
    }()
    
    let typeContent: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.textAlignment = .left
        return title
    }()
    
    let videoSite: UILabel = {
        let score = UILabel()
        score.textAlignment = .left
        score.numberOfLines = 5
        return score
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(videoName)
        addSubview(typeContent)
        addSubview(videoSite)
        videoName.translatesAutoresizingMaskIntoConstraints = false
        typeContent.translatesAutoresizingMaskIntoConstraints = false
        videoSite.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            videoName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            videoName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            videoName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            typeContent.topAnchor.constraint(equalTo: videoName.bottomAnchor, constant: 8),
            typeContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            typeContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            videoSite.topAnchor.constraint(equalTo: typeContent.bottomAnchor, constant: 4),
            videoSite.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            videoSite.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            videoSite.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }


}
