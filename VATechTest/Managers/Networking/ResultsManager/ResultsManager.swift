//
//  ResultsManager.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

/// used to provide handler for results callback
protocol ResultsManager {
    associatedtype T: Codable
    var network: NetworkRequestor { get set }
    var resultsHandler: ((Result<T, Error>) -> Void)? { get set }

}


final class BreweryResultsManager<Object: Codable>: ResultsManager {

    var network: NetworkRequestor
    var resultsHandler: ((Result<Object, Error>) -> Void)?

    init(network: NetworkRequestor = NetworkRequestor(session: .init())) {
        self.network = network
    }

    // MARK: - Methods
    func search(endpoint: Endpoints = .beers) {
        guard let resultsHandler = resultsHandler else {
            fatalError("⚠️ didn't set a handler for the results manager")
        }
        network.fetchFromApi(endpoint, completion: resultsHandler)
    }

}
