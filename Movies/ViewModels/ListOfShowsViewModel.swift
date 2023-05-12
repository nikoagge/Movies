//
//  ListOfShowsViewModel.swift
//  Movies
//
//  Created by Nikos Angelidis on 11/5/23.
//

import Foundation

final class ListOfShowsViewModel {
    var showsLoaded: (([ServiceShow]?, Bool) -> Void)?
    var shows: [ServiceShow]?
    
//    func fetchShows() {
//        ShowsAPIManager.shared.fetchShows { [weak self] serviceShows in
//            self?.shows = serviceShows
//            self?.handleResponse(response: serviceShows, success: true)
//        } onFailure: { [weak self] _ in
//            self?.handleResponse(response: nil, success: false)
//        }
//    }
    
    func numberOfRows() -> Int {
        return self.shows?.count ?? 0
    }
    
    func fetchShow(for index: Int) -> ServiceShow? {
        return self.shows?[index]
    }
    
    private func handleResponse(response: [ServiceShow]?, success: Bool) {
        if let showsLoaded = self.showsLoaded {
            showsLoaded(response, success)
        }
    }
}
