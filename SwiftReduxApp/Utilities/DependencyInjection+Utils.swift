//
//  GlobalVariables.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/2/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import UIKit

private let locator: DIContainer = (UIApplication.shared.delegate as! AppDelegate).locator

func GetService<T: NetworkService>() -> T {
    return locator.resolve()
}
