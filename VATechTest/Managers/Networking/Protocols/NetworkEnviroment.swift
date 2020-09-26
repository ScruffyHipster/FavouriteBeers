//
//  NetworkEnviroment.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

/// Provides a individual enviroment for network contexts
protocol NetworkEnviroment {
    var apiKey: String { get }
    var baseUrlString: String { get }
}

