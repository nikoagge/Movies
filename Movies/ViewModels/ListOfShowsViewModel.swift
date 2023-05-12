//
//  ListOfShowsViewModel.swift
//  Movies
//
//  Created by Nikos Angelidis on 12/5/23.
//

import Foundation

final class ListOfShowsViewModel {
    var showsLoaded: ((Bool) -> Void)?
    var listOfShows: [ServiceShow]?
    var listOfRealmShows: [RealmShow]?
    
    init() {
        RealmManager.shared.anotherFetchShows { [weak self] realmShows in
            guard let self = self, let realmShows = realmShows else {
                // TODO: Fix optional chaining there
                self?.fetchShows()
                
                return
            }
            if realmShows.count > 0 {
                self.listOfRealmShows = realmShows
                handleShowsLoaded(success: true)
            } else {
                self.fetchShows()
            }
        }
    }
    
    func fetchShows() {
        ShowsAPI.shared.getShows { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let success):
                self.listOfShows = success
                success.forEach { serviceShow in
                    RealmManager.shared.addRealmShow(serviceShow)
                }
                handleShowsLoaded(success: true)
            case .failure(_):
                handleShowsLoaded(success: false)
            }
        }
    }
    
    func numberOfRows() -> Int {
        if let listOfRealmShows = listOfRealmShows {
            return listOfRealmShows.count
        } else if let listOfShows = listOfShows {
            return listOfShows.count
        } else {
            return 0
        }
    }
    
    func fetchShow(for index: Int, onCompletion: @escaping ((ServiceShow?, RealmShow?) -> Void)) {
        if let listOfRealmShows = listOfRealmShows, listOfRealmShows.count > 0 {
            onCompletion(nil, listOfRealmShows[index])
        } else {
            onCompletion(listOfShows?[index], nil)
        }
    }
    
    private func handleShowsLoaded(success: Bool) {
        if let showsLoaded = self.showsLoaded {
            showsLoaded(success)
        }
    }
}
