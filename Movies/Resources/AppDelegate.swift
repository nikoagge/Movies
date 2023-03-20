//
//  AppDelegate.swift
//  Movies
//
//  Created by Nikos Aggelidis on 17/3/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let listOfShowsViewController = ListOfShowsViewController()
        let navigationController = UINavigationController(rootViewController: listOfShowsViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
