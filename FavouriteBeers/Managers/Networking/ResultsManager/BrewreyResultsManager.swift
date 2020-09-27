//
//  BreweryResultsManager.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

/// Handles the requests to the breweryDB api and handler for returned data
final class BreweryResultsManager<Object: Codable>: ResultsManagerProtocol {

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
