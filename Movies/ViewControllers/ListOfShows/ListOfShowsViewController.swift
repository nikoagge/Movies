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
    let listOfShowsViewModel = ListOfShowsViewModel()
    
    let listOfShowsTableView = UITableView.newAutoLayout()
    
    typealias CompletionClosure = (([ServiceShow]?, HTTPError?) -> Void)

//    private var networkManager:NetworkManagerType = NetworkManager()
    private let realmManager: RealmManagerType = RealmManager()
    
    var listOfServiceShows = [ServiceShow]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        ShowsAPI.shared.getShows { result in
            switch result {
            case .success(let success):
                debugPrint(success)
            case .failure(let failure):
                debugPrint(failure)

            }
        }
        
//        loadData()
    }
    
    private func loadData() {
//        listOfShowsViewModel.fetchShows()
        self.listOfShowsTableView.reloadData()
    }
    
    @objc func refreshDataFromService() {
        listOfShowsViewModel.shows?.removeAll()
        loadData()
    }
}
