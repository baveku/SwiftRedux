//
//  ErrorMiddleware.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/9/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import ReSwift
import ReSwiftThunk
import ReSwiftRouter

struct ErrorThunk {
    static func handleError(_ error: Error) -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            switch error {
            case RequestError.tokenExpire:
                break
            default:
                break
            }
        }
    }
}
