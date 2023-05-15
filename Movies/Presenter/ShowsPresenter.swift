//
//  ShowsPresenter.swift
//  Movies
//
//  Created by Nikos Angelidis on 12/5/23.
//

import UIKit

protocol ShowsPresenterDelegate {
    func presentShows(serviceShows: [ServiceShow])
    func presentShowsFromDatabase(realmShows: [RealmShow])
}

typealias PresenterDelegate = ShowsPresenterDelegate & NavigableViewController & UIViewController

final class ShowsPresenter {
    weak var delegate: PresenterDelegate?
    
    func fetchShows() {
        let realmShows = RealmManager.shared.loadRealmShows()
        if realmShows.count > 0 {
            delegate?.presentShowsFromDatabase(realmShows: realmShows)
        } else {
            ShowsAPI.shared.getShows { [weak self] response in
                guard let self = self else { return }
                switch response {
                case .success(let success):
                    delegate?.presentShows(serviceShows: success)
                    _ = success.map { serviceShow in
                        RealmManager.shared.addRealmShow(serviceShow)
                    }
                    
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func didSelectShow(show: ServiceShow?, showFromDatabase: RealmShow?) {
        var imageURL = ""
        var name = ""
        var language = ""
        var type = ""
        var rating = ""
        if show != nil {
            imageURL = show?.image?.medium ?? ""
            name = show?.name ?? ""
            language = show?.name ?? ""
            type = show?.type ?? ""
            rating = "\(String(describing: show?.rating?.average))"
        } else {
            imageURL = showFromDatabase?.imageMedium ?? ""
            name = showFromDatabase?.name ?? ""
            language = showFromDatabase?.language ?? ""
            type = showFromDatabase?.type ?? ""
            rating = "\(String(describing: showFromDatabase?.rating))"
        }
        delegate?.navigate(.init(
            pageType: .showDetailViewController(
                showImageURLString: imageURL,
                showName: name,
                showLanguage: language,
                showType: type,
                showRating: rating
            ),
            navigationStyle: .push(animated: true)
        ))
    }
}
