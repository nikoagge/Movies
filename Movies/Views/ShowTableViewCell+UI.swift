//
//  ShowTableViewCell+UI.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

extension ShowTableViewCell {
    func setupUI() {
        setupShowImageImageView()
        setupShowNameLabel()
        setupShowRatingLabel()
    }
    
    private func setupShowImageImageView() {
        contentView.addSubview(showImageImageView)
        NSLayoutConstraint.activate([
            showImageImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            showImageImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            showImageImageView.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -20),
            showImageImageView.heightAnchor.constraint(equalToConstant: 80),
            showImageImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func setupShowNameLabel() {
        showNameLabel.numberOfLines = 0
        showNameLabel.font = UIFont.systemFont(ofSize: 17)
        contentView.addSubview(showNameLabel)
        NSLayoutConstraint.activate([
            showNameLabel.leadingAnchor.constraint(equalTo: showImageImageView.trailingAnchor, constant: 13),
            showNameLabel.centerYAnchor.constraint(equalTo: showImageImageView.centerYAnchor)
        ])
    }
    
    private func setupShowRatingLabel() {
        showRatingLabel.numberOfLines = 0
        showRatingLabel.font = UIFont.systemFont(ofSize: 15)
        contentView.addSubview(showRatingLabel)
        NSLayoutConstraint.activate([
            showRatingLabel.leadingAnchor.constraint(equalTo: showNameLabel.trailingAnchor, constant: 13),
            showRatingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            showRatingLabel.centerYAnchor.constraint(equalTo: showNameLabel.centerYAnchor)
        ])
    }
}
