//
//  DetailThirdRowTableViewCell.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import UIKit

class DetailThirdRowTableViewCell: UITableViewCell {
    
    static let identifier = "DetailThirdRowTableViewCell"
    
    let movieTrailerLabel: UILabel = {
        let title = UILabel()
        title.text = "Movie Related Videos"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.font = UIFont.boldSystemFont(ofSize: 20.0)
        return title
    }()
    
    let movieTrailerContent: UILabel = {
        let title = UILabel()
        title.text = "Click see the Movie Related Videos"
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
        addSubview(movieTrailerLabel)
        addSubview(movieTrailerContent)
        movieTrailerLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTrailerContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieTrailerLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieTrailerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieTrailerLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieTrailerLabel.bottomAnchor.constraint(equalTo: movieTrailerContent.topAnchor),
            movieTrailerContent.topAnchor.constraint(equalTo: movieTrailerLabel.bottomAnchor),
            movieTrailerContent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieTrailerContent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieTrailerContent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }

}
