//
//  ListOfShowsViewModel.swift
//  Movies
//
//  Created by Nikos Angelidis on 12/5/23.
//

import Foundation

final class ListOfShowsViewModel {
    var showsLoaded: (([ServiceShow]?, Bool) -> Void)?
    var listOfShows: [ServiceShow]?
    
    init() {
        fetchShows()
    }
    
    func fetchShows() {
        ShowsAPI.shared.getShows { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.listOfShows = success
                self.handleResponse(response: success, success: true)
            case .failure(_):
                self.handleResponse(response: nil, success: false)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return listOfShows?.count ?? 0
    }
    
    func fetchShow(for index: Int) -> ServiceShow? {
        return listOfShows?[index]
    }
        
    private func handleResponse(response: [ServiceShow]?, success: Bool) {
        if let showsLoaded = self.showsLoaded {
            showsLoaded(response, success)
        }
    }
}
