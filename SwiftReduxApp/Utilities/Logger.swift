//
//  Logger.swift
//  KMart
//
//  Created by Bách on 5/1/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation
import XCGLogger

let log = XCGLogger.default

func setupLogger() {
    log.setup(
        level: .debug,
        showThreadName: false,
        showLevel: false,
        showFileNames: true,
        showLineNumbers: false,
        showDate: false,
        fileLevel: .debug
    )
}
