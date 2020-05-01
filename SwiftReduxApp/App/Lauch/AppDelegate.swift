//
//  AppDelegate.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locator: DIContainer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        locator = DIContainer()
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        
        let mainNavigation = UINavigationController(rootViewController: MainViewController())
        mainNavigation.navigationBar.isHidden = true
        window?.rootViewController = mainNavigation
        window?.makeKeyAndVisible()
        setupLogger()
        return true
    }
    
    func registerDependency() {
        locator.register { AuthService() }
    }
}

