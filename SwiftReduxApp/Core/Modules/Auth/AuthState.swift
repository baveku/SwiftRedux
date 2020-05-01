//
//  AuthState.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift

enum AuthorizationStatus {
    case authorized
    case unauthorized
}

struct AuthState: StateType {
    var token: String = ""
    var status: AuthorizationStatus = .unauthorized
}
