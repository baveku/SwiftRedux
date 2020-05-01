//
//  AppState.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

struct AppState: StateType {
    var navigationState: NavigationState
    var auth: AuthState
    
    init(auth: AuthState? = nil, navigationState: NavigationState? = nil) {
        self.navigationState = navigationState ?? NavigationState()
        self.auth = auth ?? AuthState()
    }
}
