//
//  AuthProvider.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import Moya
import Promises

class AuthService: INetworkService {
    private let provider = APIProvider<AuthAPI>()
    
    func login(email: String, password: String) -> Promise<LoginResponse> {
        return self.provider.request(.login(.init(email: email, password: password)))
    }
    
    func weather() -> Promise<LoginResponse> {
        return self.provider.request(.weather)
    }
}
