//
//  AuthThunk.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftThunk
import ReSwiftRouter
import Promises

struct AuthThunk {
    static func login(email: String, password: String) -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            let authService: AuthService = APIManager.getService()
            let state = getState()
            authService.login(email: email, password: password).then(on: .global()) { (response) in
                
            }.catch { (error) in
                
            }
        }
    }
    
    static func logout() -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            print("HelloBaby")
        }
    }
    
    static func weather() -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            let service: AuthService = APIManager.getService()
            service.weather().then { (response) in
                print(response)
            }.catch { (error) in
                print(error.localizedDescription)
            }
        }
    }
}
