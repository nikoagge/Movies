//
//  ListOfShowsViewController.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

final class ListOfShowsViewController:
    UIViewController,
    NavigableViewController, ShowsPresenterDelegate {
    private var listOfShows = [ServiceShow]()
    private var showsFromDatabase = [RealmShow]()
    private let showsPresenter = ShowsPresenter()
    private let listOfShowsTableView = UITableView.newAutoLayout()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        showsPresenter.delegate = self
        showsPresenter.fetchShows()
    }
    
    func presentShows(serviceShows: [ServiceShow]) {
        listOfShows = serviceShows
        DispatchQueue.main.async {
            self.listOfShowsTableView.reloadData()
        }
    }
    
    func presentShowsFromDatabase(realmShows: [RealmShow]) {
        showsFromDatabase = realmShows
        DispatchQueue.main.async {
            self.listOfShowsTableView.reloadData()
        }
    }
    
    @objc func refreshDataFromService() {
        listOfShows.removeAll()
        listOfShowsTableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: { [weak self] in
            guard let self = self else { return }
            self.showsPresenter.fetchShows()
        })
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
        return showsFromDatabase.count > 0 ? showsFromDatabase.count : listOfShows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let showTableViewCell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: ShowTableViewCell.self),
            for: indexPath
        ) as? ShowTableViewCell else {
            return UITableViewCell()
        }
        
        if showsFromDatabase.count > 0 {
            showTableViewCell.configure(serviceShow: nil, realmShow: showsFromDatabase[indexPath.row])
        } else {
            showTableViewCell.configure(serviceShow: listOfShows[indexPath.row], realmShow: nil)
        }
        
        return showTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if showsFromDatabase.count > 0 {
            showsPresenter.didSelectShow(
                show: nil,
                showFromDatabase: showsFromDatabase[indexPath.row]
            )
        } else {
            showsPresenter.didSelectShow(
                show: listOfShows[indexPath.row],
                showFromDatabase: nil
            )
        }
    }
}
