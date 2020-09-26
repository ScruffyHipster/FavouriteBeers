//
//  Reusable.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

/// Provides a default `reuseIdentifier` to the entities that conform to it.
protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
