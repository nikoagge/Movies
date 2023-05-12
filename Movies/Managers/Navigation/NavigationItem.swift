//
//  NavigationItem.swift
//  Movies
//
//  Created by Nikos Aggelidis on 19/3/23.
//

import UIKit

struct NavigationItem {
    enum PageType {
        case viewControllers(viewControllers: [UIViewController])
        case viewController(viewController: UIViewController)
        case showDetailViewController(serviceShow: ServiceShow?, realmShow: RealmShow?)
    }
    
    enum NavigationStyle {
        case present(animated: Bool)
        case presentWithinNavigation(animated: Bool, customPresenter: UIViewController?)
        case push(animated: Bool)
        case replace(animated: Bool)
    }
    
    let pageType: PageType
    let navigationStyle: NavigationStyle
}
