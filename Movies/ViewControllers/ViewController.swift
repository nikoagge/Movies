//
//  ViewController.swift
//  Movies
//
//  Created by Nikos Aggelidis on 17/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var networkManager:NetworkManagerType = NetworkManager()
    private let realmManager: RealmManagerType = RealmManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        networkManager.getServiceShows { [weak self] result in
            switch result {
            case .success(let serviceShows):
                serviceShows.map { self?.realmManager.addRealmShow($0) }
                
                self?.realmManager.loadRealmShows()
                
                self?.realmManager.printPath()
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
}
