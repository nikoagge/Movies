//
//  ListOfShowsViewController+TableView.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

extension ListOfShowsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfRealmShows == nil ? listOfServiceShows.count : listOfRealmShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let showTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ShowTableViewCell.self),
            for: indexPath
        ) as? ShowTableViewCell else {
            return UITableViewCell()
        }
        
        if listOfRealmShows == nil {
            showTableViewCell.configure(serviceShow: listOfServiceShows[indexPath.row], realmShow: nil)
        } else {
            showTableViewCell.configure(serviceShow: nil, realmShow: listOfRealmShows[indexPath.row])
        }
        
        return showTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
