//
//  ShowDetailViewController+UI.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

extension ShowDetailViewController {
    func setupUI() {
        view.backgroundColor = .systemBackground
        setupShowImageImageView()
        setupShowDescription()
    }
    
    private func setupShowImageImageView() {
        ImageLoader.shared.fetchImage(urlString: show?.image?.medium) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.showImageImageView.image = image
                }
                
            case .failure(_):                
                break
            }
        }
        view.addSubview(showImageImageView)
        NSLayoutConstraint.activate([
            showImageImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showImageImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showImageImageView.heightAnchor.constraint(equalToConstant: 200),
            showImageImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupShowDescription() {
        showDescriptionLabel.text = "Name of the show is \(show?.name ?? "no name show"), its language is \(show?.language ?? "no language value"), its type is \(show?.type ?? "no show type exists") and finally its rating is \(String(describing: show?.rating?.average))."
        showDescriptionLabel.numberOfLines = 0
        showDescriptionLabel.font = UIFont.systemFont(ofSize: 20)
        showDescriptionLabel.lineBreakMode = .byWordWrapping
        view.addSubview(showDescriptionLabel)
        NSLayoutConstraint.activate([
            showDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            showDescriptionLabel.topAnchor.constraint(equalTo: showImageImageView.bottomAnchor, constant: 20),
            showDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            showDescriptionLabel.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: -20)
        ])
    }

}
