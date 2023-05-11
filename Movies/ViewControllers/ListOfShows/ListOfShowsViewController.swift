//
//  ListOfShowsViewController.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

final class ListOfShowsViewController:
    UIViewController,
    NavigableViewController {
    let listOfShowsTableView = UITableView.newAutoLayout()
    
//    private var networkManager:NetworkManagerType = NetworkManager()
    private let realmManager: RealmManagerType = RealmManager()
    
    var listOfServiceShows = [ServiceShow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MoviesAPIManager.shared.fetchShows { movies in
            debugPrint(movies)
        } onFailure: {
            debugPrint("Failure")
        }

//        setupUI()
//        loadData()
    }
    
//    private func loadData() {
//        self.realmManager.loadRealmShows()
//        if listOfRealmShows == nil || listOfRealmShows.count == 0 {
//            refreshDataFromService()
//        } else {
//            DispatchQueue.main.async {
//                self.listOfShowsTableView.reloadData()
//            }
//        }
//    }
    
//    @objc func refreshDataFromService() {
//        self.listOfServiceShows.removeAll()
//        networkManager.getServiceShows { [weak self] result in
//            switch result {
//            case .success(let serviceShows):
//                self?.listOfServiceShows = serviceShows
//                _ = serviceShows.map { self?.realmManager.addRealmShow($0) }
//
//                DispatchQueue.main.async {
//                    self?.listOfShowsTableView.reloadData()
//                }
//            case .failure(let failure):
//                debugPrint(failure)
//            }
//        }
//    }
}
