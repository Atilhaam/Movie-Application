//
//  DetailReviewTableViewCell.swift
//  Movie App
//
//  Created by Ilham Wibowo on 24/02/23.
//

import UIKit

class DetailReviewTableViewCell: UITableViewCell {

    static let identifier = "DetailReviewTableViewCell"
    
    let authorNameLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.text = "Author"
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    let authorNameContent: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()

    let userNameLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.text = "Username"
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    let userNameContent: UILabel = {
        let title = UILabel()
        title.numberOfLines = 1
        title.textAlignment = .left
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    
    let overviewLabel: UILabel = {
        let title = UILabel()
        title.text = "Review"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    let overviewContent: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .justified
        title.font = UIFont.boldSystemFont(ofSize: 16)
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
        addSubview(authorNameLabel)
        addSubview(authorNameContent)
        addSubview(userNameLabel)
        addSubview(userNameContent)
        addSubview(overviewLabel)
        addSubview(overviewContent)
        authorNameLabel.translatesAutoresizingMaskIntoConstraints = false
        authorNameContent.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameContent.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            authorNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            authorNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorNameContent.topAnchor.constraint(equalTo: authorNameLabel.bottomAnchor),
            authorNameContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            authorNameContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            userNameLabel.topAnchor.constraint(equalTo: authorNameContent.bottomAnchor, constant: 8),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userNameContent.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor),
            userNameContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            userNameContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            overviewLabel.topAnchor.constraint(equalTo: userNameContent.bottomAnchor, constant: 8),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overviewContent.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor),
            overviewContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            overviewContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
        ])
    }

}
