//
//  ViewController.swift
//  Movies
//
//  Created by Nikos Aggelidis on 17/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var networkManager:NetworkManagerType = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        networkManager.getShows { result in
            switch result {
            case .success(let success):
                debugPrint(success)
            case .failure(let failure):
                debugPrint(failure)
            }
        }
    }
}
