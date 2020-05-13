//
//  RootRoutable.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/9/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwiftRouter
import UIKit

class RootRoutable: Routable {
    private var rootNavigation: UINavigationController!
    private var tabbarController: UITabBarController!
    
    init(tabbar: UITabBarController) {
        self.rootNavigation = tabbar.navigationController!
        self.tabbarController = tabbar
    }
    
//    func pushRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
//        switch routeElementIdentifier {
//        case "":
//            break
//        default:
//            break
//        }
//    }
//
//    func popRouteSegment(_ routeElementIdentifier: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) {
//
//    }
//
//    func changeRouteSegment(_ from: RouteElementIdentifier, to: RouteElementIdentifier, animated: Bool, completionHandler: @escaping RoutingCompletionHandler) -> Routable {
//
//    }
}
