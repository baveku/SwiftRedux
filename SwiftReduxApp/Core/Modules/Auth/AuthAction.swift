//
//  AuthAction.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift

enum AuthAction: Action {
    case logout
    case login(email: String, password: String)
    case refreshToken
    case loginSuccess(token: String)
    case signup
}
