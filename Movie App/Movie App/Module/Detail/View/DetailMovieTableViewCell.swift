//
//  DetailTableViewCell.swift
//  Movie App
//
//  Created by Ilham Wibowo on 23/02/23.
//

import UIKit

class DetailMovieTableViewCell: UITableViewCell {

    static let identifier = "DetailMovieTableViewCell"
    
    let imagePoster: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 30.0)
        return title
    }()
    
    let overviewLabel: UILabel = {
        let title = UILabel()
        title.text = "Overview"
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
    
    let productionCompanyLabel: UILabel = {
        let platforms = UILabel()
        platforms.textAlignment = .left
        platforms.text = "Production Company"
        platforms.font = UIFont.boldSystemFont(ofSize: 20.0)
        return platforms
    }()

    let productionCompanyContent: UILabel = {
        let platforms = UILabel()
        platforms.textAlignment = .left
        platforms.font = UIFont.boldSystemFont(ofSize: 16)
        platforms.numberOfLines = 0
        return platforms
    }()

    let releaseDateLabel: UILabel = {
        let score = UILabel()
        score.text = "Release Date"
        score.font = UIFont.boldSystemFont(ofSize: 20.0)
        score.textAlignment = .left
        return score
    }()

    let releasedateContent: UILabel = {
        let score = UILabel()
        score.textAlignment = .left
        score.font = UIFont.boldSystemFont(ofSize: 16)
        return score
    }()
    
    let statusLabel: UILabel = {
        let genre = UILabel()
        genre.text = "Status"
        genre.font = UIFont.boldSystemFont(ofSize: 20)
        return genre
    }()

    let statusContent: UILabel = {
        let genre = UILabel()
        genre.textAlignment = .left
        genre.numberOfLines = 0
        genre.font = UIFont.boldSystemFont(ofSize: 16)
        return genre
    }()

    let genresLabel: UILabel = {
        let developer = UILabel()
        developer.text = "Genres"
        developer.font = UIFont.boldSystemFont(ofSize: 20)
        developer.textAlignment = .left
        return developer
    }()

    let genreContent: UILabel = {
        let developer = UILabel()
        developer.font = UIFont.boldSystemFont(ofSize: 16)
        developer.textAlignment = .left
        developer.numberOfLines = 0
        return developer
    }()

    let voteAverageLabel: UILabel = {
        let publisher = UILabel()
        publisher.text = "Vote Average"
        publisher.font = UIFont.boldSystemFont(ofSize: 20)
        return publisher
    }()

    let voteAverageContent: UILabel = {
        let publisher = UILabel()
        publisher.font = UIFont.boldSystemFont(ofSize: 16)
        publisher.numberOfLines = 0
        publisher.textAlignment = .left
        return publisher
    }()
    
    let productionCountriesLabel: UILabel = {
        let productionCountriesLabel = UILabel()
        productionCountriesLabel.text = "Production Countries"
        productionCountriesLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return productionCountriesLabel
    }()

    let productionCountriesContent: UILabel = {
        let productionCountriesContent = UILabel()
        productionCountriesContent.font = UIFont.boldSystemFont(ofSize: 16)
        productionCountriesContent.numberOfLines = 0
        productionCountriesContent.textAlignment = .left
        return productionCountriesContent
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraint() {
        addSubview(imagePoster)
        addSubview(titleLabel)
        addSubview(overviewLabel)
        addSubview(overviewContent)
        addSubview(productionCompanyLabel)
        addSubview(productionCompanyContent)
        addSubview(releaseDateLabel)
        addSubview(releasedateContent)
        addSubview(statusLabel)
        addSubview(statusContent)
        addSubview(genresLabel)
        addSubview(genreContent)
        addSubview(voteAverageLabel)
        addSubview(voteAverageContent)
        addSubview(productionCountriesLabel)
        addSubview(productionCountriesContent)
        imagePoster.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewContent.translatesAutoresizingMaskIntoConstraints = false
        productionCompanyLabel.translatesAutoresizingMaskIntoConstraints = false
        productionCompanyContent.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releasedateContent.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusContent.translatesAutoresizingMaskIntoConstraints = false
        genresLabel.translatesAutoresizingMaskIntoConstraints = false
        genreContent.translatesAutoresizingMaskIntoConstraints = false
        voteAverageLabel.translatesAutoresizingMaskIntoConstraints = false
        voteAverageContent.translatesAutoresizingMaskIntoConstraints = false
        productionCountriesLabel.translatesAutoresizingMaskIntoConstraints = false
        productionCountriesContent.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePoster.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height/2),
            imagePoster.widthAnchor.constraint(equalToConstant: contentView.frame.width),
            imagePoster.centerXAnchor.constraint(equalTo: centerXAnchor),
            imagePoster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagePoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: imagePoster.bottomAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overviewContent.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor),
            overviewContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            overviewContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            productionCompanyLabel.topAnchor.constraint(equalTo: overviewContent.bottomAnchor, constant: 8),
            productionCompanyLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productionCompanyLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            productionCompanyContent.topAnchor.constraint(equalTo: productionCompanyLabel.bottomAnchor),
            productionCompanyContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            productionCompanyContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            releaseDateLabel.topAnchor.constraint(equalTo: productionCompanyContent.bottomAnchor, constant: 16),
            releaseDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            releasedateContent.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor),
            releasedateContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            releasedateContent.leadingAnchor.constraint(equalTo: leadingAnchor),

            statusLabel.topAnchor.constraint(equalTo: releasedateContent.bottomAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            statusContent.topAnchor.constraint(equalTo: statusLabel.bottomAnchor),
            statusContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            statusContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            genresLabel.topAnchor.constraint(equalTo: statusContent.bottomAnchor, constant: 16),
            genresLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            genresLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            genreContent.topAnchor.constraint(equalTo: genresLabel.bottomAnchor),
            genreContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            genreContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            voteAverageLabel.topAnchor.constraint(equalTo: genreContent.bottomAnchor, constant: 16),
            voteAverageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            voteAverageLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            voteAverageContent.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor),
            voteAverageContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            voteAverageContent.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            productionCountriesLabel.topAnchor.constraint(equalTo: voteAverageContent.bottomAnchor, constant: 16),
            productionCountriesLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            productionCountriesLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            productionCountriesContent.topAnchor.constraint(equalTo: productionCountriesLabel.bottomAnchor),
            productionCountriesContent.trailingAnchor.constraint(equalTo: trailingAnchor),
            productionCountriesContent.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
        
    }
    

}


