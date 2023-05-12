//
//  NavigableViewController.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

protocol NavigableViewController where Self: UIViewController {
    func navigate(_ navigationItem: NavigationItem)
    func push(_ pageType: NavigationItem.PageType)
}

extension NavigableViewController {
    func navigate(_ navigationItem: NavigationItem) {
        var controllersToInitialNavigation: [UIViewController] = []
        var controllerToNavigate: UIViewController!
        
        switch navigationItem.pageType {
        case .viewControllers(let viewControllers): controllersToInitialNavigation = viewControllers
        case .viewController(let viewController): controllerToNavigate = viewController
        case .showDetailViewController(let show):
            controllerToNavigate = ShowDetailViewController(show: show)
        }
        
        if let controllerToNavigate = controllerToNavigate {
            controllersToInitialNavigation.append(controllerToNavigate)
        }
        
        DispatchQueue.main.async {
            switch navigationItem.navigationStyle {
            case .present(let animated):
                controllerToNavigate.modalPresentationStyle = .overFullScreen
                self.present(controllerToNavigate, animated: animated)

            case .presentWithinNavigation(let animated, let presenter):
                var navigationController = UINavigationController()
                
                if controllersToInitialNavigation.count == 0, controllerToNavigate != nil {
                    controllerToNavigate.modalPresentationStyle = .overFullScreen
                    navigationController = UINavigationController(rootViewController: controllerToNavigate)
                } else if controllersToInitialNavigation.count > 0 {
                    navigationController.viewControllers = controllersToInitialNavigation
                }

                navigationController.isNavigationBarHidden = true
                navigationController.modalPresentationStyle = .overFullScreen
                (presenter ?? self).present(navigationController, animated: animated)

            case .push(let animated):
                self.navigationController?.pushViewController(controllerToNavigate, animated: animated)

            case .replace(let animated):
                if var viewControllers = self.navigationController?.viewControllers {
                    viewControllers.removeLast()
                    viewControllers.append(controllerToNavigate)
                    self.navigationController?.setViewControllers(viewControllers, animated: animated)
                }
            }
        }
    }
    
    func push(_ pageType: NavigationItem.PageType) {
        navigate(NavigationItem(pageType: pageType, navigationStyle: .push(animated: true)))
    }
}
