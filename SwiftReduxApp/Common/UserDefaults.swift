//
//  UserDefaults.swift
//  KMart
//
//  Created by Bách on 5/1/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import UIKit

@propertyWrapper
struct Cache<Value> {
    let key: String
    var storage: UserDefaults = .standard

    var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set { storage.setValue(newValue, forKey: key) }
    }
}
