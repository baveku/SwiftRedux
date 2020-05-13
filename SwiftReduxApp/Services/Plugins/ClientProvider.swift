//
//  Authorization.swift
//  KMart
//
//  Created by Bách on 5/1/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import Moya
import Promises

private func embeededPlugins(_ plugins: [PluginType]) -> [PluginType] {
    var result = plugins
    result.append(NetworkPlugins.authPlugin)
    return result
}

struct NetworkPlugins {
    static let authPlugin = AccessTokenPlugin { (_) -> String in
        return appStore.state.auth.token
    }
}

class APIProvider<T: TargetType>: MoyaProvider<T> {
    override init(endpointClosure: @escaping MoyaProvider<T>.EndpointClosure = MoyaProvider.defaultEndpointMapping, requestClosure: @escaping MoyaProvider<T>.RequestClosure = MoyaProvider<T>.defaultRequestMapping, stubClosure: @escaping MoyaProvider<T>.StubClosure = MoyaProvider.neverStub, callbackQueue: DispatchQueue? = nil, session: Session = MoyaProvider<Target>.defaultAlamofireSession(), plugins: [PluginType] = [], trackInflights: Bool = false) {
        let embeddedPlugins = embeededPlugins(plugins)
        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: callbackQueue, session: session, plugins: embeddedPlugins, trackInflights: trackInflights)
    }
    
    /// Designated request-making method.
    ///
    /// - Parameters:
    ///   - token: Entity, which provides specifications necessary for a `MoyaProvider`.
    ///   - callbackQueue: Callback queue. If nil - queue from provider initializer will be used.
    /// - Returns: Promise response object.
    func request<T: Codable>(_ token: Target, callbackQueue: DispatchQueue? = nil) -> Promise<T> {
        return Promise<T> { fulfill, reject in
            self.request(
                token,
                callbackQueue: callbackQueue,
                progress: nil,
                completion: { result in
                    switch result {
                    case let .success(response):
                        let statusCode = response.statusCode
                        let (_, error) = self.filterStatusCode(statusCode)
                        if let error = error {
                            return reject(error)
                        }
                        
                        do {
                            let result = try JSONDecoder().decode(T.self, from: response.data)
                            fulfill(result)
                        } catch let error {
                            reject(error)
                        }
                    case let .failure(error):
                        reject(error)
                    }
                }
            )
        }
    }
    
    private func filterStatusCode(_ statusCode: Int) -> (Bool, Error?) {
        switch statusCode {
        case 200..<300:
            return (true, nil)
        case 401:
            return (false, RequestError.tokenNotFound)
        default:
            return (false, nil)
        }
    }
}

protocol APITargetType: TargetType, AccessTokenAuthorizable {}
extension APITargetType {
    var authorizationType: AuthorizationType? {
        return .bearer
    }
    
    var headers: [String : String]? {
        return nil
    }
}
