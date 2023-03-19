//
//  ShowDetailViewController+UI.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

extension ShowDetailViewController {
    func setupUI() {
        setupShowImageImageView()
        setupShowDescription()
    }
    
    private func setupShowImageImageView() {
//        showImageImageView.image = showImage
        view.addSubview(showImageImageView)
        NSLayoutConstraint.activate([
            showImageImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showImageImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showImageImageView.heightAnchor.constraint(equalToConstant: 200),
            showImageImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupShowDescription() {
        showDescriptionLabel.text = "Name of the show is \(showName ?? "no name show"), its language is \(showLanguage ?? "no language value"), its type is \(showType ?? "no show type exists") and finally its rating is \(showRating ?? "0")."
        showDescriptionLabel.numberOfLines = 0
        showDescriptionLabel.font = UIFont.systemFont(ofSize: 20)
        showDescriptionLabel.lineBreakMode = .byWordWrapping
        view.addSubview(showDescriptionLabel)
        NSLayoutConstraint.activate([
            showDescriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showDescriptionLabel.topAnchor.constraint(equalTo: showImageImageView.bottomAnchor, constant: 20),
            showDescriptionLabel.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])
    }

}
