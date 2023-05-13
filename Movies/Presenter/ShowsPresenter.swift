//
//  ShowsPresenter.swift
//  Movies
//
//  Created by Nikos Angelidis on 12/5/23.
//

import UIKit

protocol ShowsPresenterDelegate {
    func presentShows(serviceShows: [ServiceShow])
}

typealias PresenterDelegate = ShowsPresenterDelegate & NavigableViewController & UIViewController

final class ShowsPresenter {
    weak var delegate: PresenterDelegate?
    
    func fetchShows() {
        ShowsAPI.shared.getShows { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let success):
                delegate?.presentShows(serviceShows: success)
                
            case .failure(_):
                break
            }
        }
    }
    
    func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
    
    func didSelectShow(_ show: ServiceShow) {
        delegate?.navigate(.init(pageType: .showDetailViewController(showImageURLString: show.image?.medium, showName: show.name, showLanguage: show.language, showType: show.type, showRating: "\(String(describing: show.rating?.average))"), navigationStyle: .push(animated: true)))
    }
}
