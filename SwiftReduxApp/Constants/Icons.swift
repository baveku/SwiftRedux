//
//  Image.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/9/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import UIKit

protocol Iconable {
    func toNamed() -> String
}

enum Icons {
    enum Tabbar: String, Iconable {
        case home = "Home"
        case profile = "profile"
        func toNamed() -> String {
            return self.rawValue
        }
    }
}


