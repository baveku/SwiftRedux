//
//  AuthAPI.swift
//  KMart
//
//  Created by Bách on 4/30/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import Moya
//https://samples.openweathermap.org/data/2.5/box/city?bbox=12,32,15,37,10&appid=439d4b804bc8187953eb36d2a8c26a02

enum AuthAPI {
    case login(LoginRequest)
    case signup
    case weather
}
extension AuthAPI: APITargetType {
    var baseURL: URL {
        return URL(string: "https://samples.openweathermap.org")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        default:
            return "/data/2.5/box/city"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login, .signup:
            return .post
        case .weather:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login(let request):
            return .requestParameters(parameters: request.parameters, encoding: JSONEncoding.default)
        case .signup:
            return .requestParameters(parameters: [:], encoding: JSONEncoding.default)
        case .weather:
            //bbox=12,32,15,37,10&appid=439d4b804bc8187953eb36d2a8c26a02
            let params = ["bbox": "12,32,15,37,10", "appid": "439d4b804bc8187953eb36d2a8c26a02"]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
}
