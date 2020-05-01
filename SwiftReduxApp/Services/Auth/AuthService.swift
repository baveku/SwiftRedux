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

class AuthService: NetworkService {
    private let provider = KMartProvider<AuthAPI>()
    
    func allProducts() -> Promise<AllProductsResponse> {
        return self.provider.request(.signup)
    }
}
