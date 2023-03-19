//
//  ShowTableViewCell.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

final class ShowTableViewCell: UITableViewCell {
    let showImageImageView = UIImageView.newAutoLayout()
    let showNameLabel = UILabel.newAutoLayout()
    let showRatingLabel = UILabel.newAutoLayout()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white

        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(serviceShow: ServiceShow?, realmShow: RealmShow?) {
        let showName = serviceShow == nil ? realmShow?.name : (serviceShow?.name ?? "Show") + ": "
        let showRating = serviceShow == nil ? "\(realmShow?.rating ?? 0)" : "\(serviceShow?.rating?.average ?? 0)"
        let showImageURL = serviceShow == nil ? realmShow?.imageMedium : serviceShow?.image?.medium
        showNameLabel.text = showName
        showRatingLabel.text = showRating
        ImageLoader.shared.fetchImage(urlString: showImageURL) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.showImageImageView.image = image
                }
                
            case .failure(let error):
                debugPrint(String(describing: error))
                
                break
            }
        }
    }
}
