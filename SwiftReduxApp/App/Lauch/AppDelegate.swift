//
//  AppDelegate.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import UIKit
import ReSwiftRouter
#if DEBUG
import FlipperKit
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var locator: DIContainer!
    var router: Router<AppState>!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFlipper(application)
        registerDependency()
        
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        
        let tabbar = MainTabbar()
        let mainNavigation = UINavigationController(rootViewController: tabbar)
        
        mainNavigation.navigationBar.isHidden = true
        window?.rootViewController = mainNavigation
        window?.makeKeyAndVisible()
        setupRouter(tabbar: tabbar)
        
        
        return true
    }
    
    func registerDependency() {
        locator = DIContainer()
        locator.register { AuthService() }
    }
    
    func setupRouter(tabbar: UITabBarController) {
        router = Router(store: appStore, rootRoutable: RootRoutable(tabbar: tabbar)) { state in
            state.select { $0.navigationState }
        }
    }
    
    func setupFlipper(_ application: UIApplication) {
        #if DEBUG
        let layoutDescriptorMapper = SKDescriptorMapper(defaults: ())
        let client = FlipperClient.shared()
        client?.add(FlipperKitLayoutPlugin(rootNode: application, with: layoutDescriptorMapper!))
        client?.add(FlipperKitNetworkPlugin(networkAdapter: SKIOSNetworkAdapter()))
        client?.add(FKUserDefaultsPlugin.init(suiteName: nil))
        client?.start()
        // Use NSLog since Flipepr doesn't capture print() by default
        NSLog("Hello from Flipper in a Swift app!")
        #endif
    }
}

