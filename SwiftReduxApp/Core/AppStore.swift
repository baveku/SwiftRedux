//
//  AppStore.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftRouter
import ReSwiftThunk

//struct ReSwiftPersist {
//    static let persistenceKey = "__PERSISTENCE__"
//    static func initState(initial: AppState) -> AppState {
//        guard let data = UserDefaults.standard.data(forKey: persistenceKey) else { return initial }
//        let state = try? JSONDecoder().decode(AppState.self, from: data)
//        return state ?? initial
//    }
//
//    static var middleware: Middleware<AppState> {
//        return { dispatch, getState in { next in return { action in
//            next(action)
//            let data = try? JSONEncoder().encode(getState())
//            UserDefaults.standard.set(data, forKey: persistenceKey)
//        }}}
//    }
//}
let thunkMiddleware: Middleware<AppState> = createThunkMiddleware()
let appStore = Store<AppState>(reducer: appReducer, state: AppState(), middleware: [thunkMiddleware])

