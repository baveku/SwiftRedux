//
//  AuthPayload.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation

struct Auth {
    struct Payload {
        struct Login {
            let email: String
            let password: String
        }
        struct SignUp {
            let email: String
            let password: String
            let displayName: String
            let phoneNumber: String
        }
    }
}
