//
//  NSObject+Util.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/9/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
extension NSObject {
    static var className: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    var stringFromInstance: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}
