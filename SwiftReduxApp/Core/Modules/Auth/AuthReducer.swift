//
//  AuthReducer.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift

func authReducer(_ action: Action, _ auth: AuthState?) -> AuthState {
    guard let action = action as? AuthAction, let auth = auth else {return AuthState()}
    var state = auth
    switch action {
    case .loginSuccess(let token):
        state.token = token
    default:
        break
    }
    return state
}

struct AuthReducer {
    static func handleAction(_ action: Action, _ auth: AuthState?) -> AuthState {
        return AuthState()
    }
}
