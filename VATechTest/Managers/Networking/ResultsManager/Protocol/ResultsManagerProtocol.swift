//
//  ResultsManagerProtocol.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

/// used to provide handler for results callback
protocol ResultsManagerProtocol {
    associatedtype T: Codable
    var network: NetworkRequestor { get set }
    var resultsHandler: ((Result<T, Error>) -> Void)? { get set }

}
