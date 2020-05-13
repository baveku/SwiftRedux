//
//  LoginRequest.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/11/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation

struct LoginRequest: Requestable {
    let email: String
    let password: String
}
