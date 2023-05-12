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
        listOfShowsViewModel.showsLoaded = { [weak self] (success) in
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
        
        listOfShowsViewModel.fetchShow(for: indexPath.row) { (serviceShow, realmShow) in
            showTableViewCell.configure(serviceShow: serviceShow, realmShow: realmShow)
        }
        
        return showTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listOfShowsViewModel.fetchShow(for: indexPath.row) { [weak self] (serviceShow, realmShow) in
            guard let self = self else { return }
            navigate(.init(
                pageType: .showDetailViewController(
                    serviceShow: serviceShow,
                    realmShow: realmShow
                ), navigationStyle: .push(animated: true)
            ))
        }
    }
}
