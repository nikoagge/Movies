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
    let listOfShowsViewModel = ListOfShowsViewModel()
    
    private let realmManager: RealmManagerType = RealmManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadData()
    }
    
    private func loadData() {
        listOfShowsViewModel.showsLoaded = { [weak self] (_, success) in
            guard let self = self else { return }
            if success {
                self.listOfShowsTableView.reloadData()
            }
        }
    }
    
    @objc func refreshDataFromService() {
        listOfShowsViewModel.listOfShows?.removeAll()
        loadData()
    }
}

// MARK: - UI
extension ListOfShowsViewController {
    func setupUI() {
        setupNavigationBar()
        setupListOfShowsTableView()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.title = "TV Shows"
        let refreshBarButtonItem =  UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshDataFromService))
        self.navigationItem.rightBarButtonItem  = refreshBarButtonItem
    }
    
    func setupListOfShowsTableView() {
        view.addSubview(listOfShowsTableView)
        listOfShowsTableView.fillToSuperview()
        listOfShowsTableView.register(ShowTableViewCell.self, forCellReuseIdentifier: String(describing: ShowTableViewCell.self))
        listOfShowsTableView.dataSource = self
        listOfShowsTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ListOfShowsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfShowsViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let showTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ShowTableViewCell.self),
            for: indexPath
        ) as? ShowTableViewCell else {
            return UITableViewCell()
        }
        
        showTableViewCell.configure(serviceShow: listOfShowsViewModel.fetchShow(for: indexPath.row), realmShow: nil)

        
//        if listOfRealmShows == nil {
//            showTableViewCell.configure(serviceShow: listOfServiceShows[indexPath.row], realmShow: nil)
//        } else {
//            showTableViewCell.configure(serviceShow: nil, realmShow: listOfRealmShows[indexPath.row])
//        }
        
        return showTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let showImageURLString = listOfRealmShows == nil ? listOfServiceShows[indexPath.row].image?.medium : listOfRealmShows[indexPath.row].imageMedium
//        let showName = listOfRealmShows == nil ? listOfServiceShows[indexPath.row].name : listOfRealmShows[indexPath.row].name
//        let showLanguage = listOfRealmShows == nil ? listOfServiceShows[indexPath.row].language : listOfRealmShows[indexPath.row].language
//        let showType = listOfRealmShows == nil ? listOfServiceShows[indexPath.row].type : listOfRealmShows[indexPath.row].type
//        let showRating = listOfRealmShows == nil ? "\(listOfServiceShows[indexPath.row].rating?.average ?? 0)" : "\(listOfRealmShows[indexPath.row].rating)"
//
//        navigate(
//            .init(
//                pageType: .showDetailViewController(
//                    showImageURLString: showImageURLString,
//                    showName: showName,
//                    showLanguage: showLanguage,
//                    showType: showType,
//                    showRating: showRating
//                ),
//                navigationStyle: .push(animated: true)
//            )
//        )
//    }
}
