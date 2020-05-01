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
import Promises

struct AuthThunk {    
    static func login(email: String, password: String) -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            let authService: AuthService = GetService()
            
        }
    }
}
