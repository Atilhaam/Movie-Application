//
//  DetailMovieSecondRowTableViewCell.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import UIKit

class DetailMovieSecondRowTableViewCell: UITableViewCell {
    
    static let identifier = "DetailMovieSecondRowTableViewCell"
    
    let userReviewLabel: UILabel = {
        let title = UILabel()
        title.text = "Users Review"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    let userReviewContent: UILabel = {
        let title = UILabel()
        title.text = "Click see Users Review"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(userReviewLabel)
        addSubview(userReviewContent)
        userReviewLabel.translatesAutoresizingMaskIntoConstraints = false
        userReviewContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userReviewLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userReviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userReviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userReviewLabel.bottomAnchor.constraint(equalTo: userReviewContent.topAnchor),
            userReviewContent.topAnchor.constraint(equalTo: userReviewLabel.bottomAnchor),
            userReviewContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userReviewContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userReviewContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
    }

}
