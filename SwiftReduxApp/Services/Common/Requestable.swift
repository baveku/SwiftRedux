//
//  Requestable.swift
//  SwiftReduxApp
//
//  Created by Bách on 5/11/20.
//  Copyright © 2020 KMart. All rights reserved.
//

import Foundation

protocol Requestable: Codable {}
extension Requestable {
    var parameters: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] } ?? [:]
    }
}
