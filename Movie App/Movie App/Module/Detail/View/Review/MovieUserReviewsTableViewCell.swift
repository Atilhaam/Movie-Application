//
//  MovieUserReviewsTableViewCell.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import UIKit

class MovieUserReviewsTableViewCell: UITableViewCell {

    static let identifier = "MovieUserReviewsTableViewCell"
    
    let authorName: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.textAlignment = .left
        return title
    }()
    
    let authorUsername: UILabel = {
        let title = UILabel()
        title.numberOfLines = 2
        title.textAlignment = .left
        return title
    }()
    
    let reviewContent: UILabel = {
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
        addSubview(authorName)
        addSubview(authorUsername)
        addSubview(reviewContent)
        authorName.translatesAutoresizingMaskIntoConstraints = false
        authorUsername.translatesAutoresizingMaskIntoConstraints = false
        reviewContent.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            authorName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            authorName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorName.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            authorUsername.topAnchor.constraint(equalTo: authorName.bottomAnchor, constant: 8),
            authorUsername.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorUsername.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            reviewContent.topAnchor.constraint(equalTo: authorUsername.bottomAnchor, constant: 4),
            reviewContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            reviewContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            reviewContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

}
