//
//  UIImage+Util.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/9/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    class func icon(_ icon: Iconable) -> UIImage? {
        return UIImage(named: icon.toNamed())
    }
}
