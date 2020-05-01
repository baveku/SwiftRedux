//
//  AuthAPI.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import Moya

enum AuthAPI {
    case login(email: String, password: String)
    case signup
}
extension AuthAPI: APITargetType {
    var baseURL: URL {
        return URL(string: "https://kmart.vn")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        default:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .signup:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let email, let password):
            let params = ["email": email, "password": password]
            return .requestParameters(parameters: params, encoding: JSONEncoding.default)
        case .signup:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        }
    }
}
