//
//  AuthResponse.swift
//  KMart
//
//  Created by Bách on 5/1/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation

struct LoginResponse: Codable {
    let token: String
    let expireTime: String
}
