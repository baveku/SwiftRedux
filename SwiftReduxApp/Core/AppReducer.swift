//
//  AppReducer.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(auth: authReducer(action, state?.auth),
                    navigationState: NavigationReducer.handleAction(action, state: state?.navigationState))
}
