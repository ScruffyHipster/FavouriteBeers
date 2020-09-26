//
//  BreweryNetworkEnviroment.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

struct BreweryNetworkEnviroment: NetworkEnviroment {

    var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: Constants.apiKey) as! String
    }

    var baseUrlString: String {
        Bundle.main.object(forInfoDictionaryKey: Constants.baseURL) as! String
    }

    /// Creates URL for webcall
    ///
    /// - Parameters:
    ///   - searchParam:
    ///   - searchTerm: Allows choice between .id & .search
    /// - Returns: URLRequest
    func createUrl(endpoint: Endpoints) -> String {
        baseUrlString.appending("\(endpoint)&key=\(apiKey)")
    }

}
