//
//  NetworkRequestor.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit
import Alamofire

final class NetworkRequestor: NetworkRequestorProtocol  {

    var session: Session
    let concurrentQueue = DispatchQueue(label: "NetworkRequestor", attributes: .concurrent)

    init(session: Session = .default) {
        self.session = session
    }

    // MARK: - Public methods

    /// Fetches Json and decodes
    /// - Parameters:
    ///   - url: url endpoint
    ///   - completion: returns result type
    public func fetchDecodable<T: Decodable>(_ url: String, completion: @escaping (Result<T, Swift.Error>) -> Swift.Void) {
        let request = self.session.request(url)
            .validate(statusCode: 200..<300)
        request.responseDecodable(of: T.self, queue: self.concurrentQueue) { (response) in
            self.concurrentQueue.async {
                completion(response.result.swiftError)
            }
        }
    }
    
}

/// Enviroment used for making specific movie requests
extension NetworkRequestor {
    /// Fetches all the beers from API
    /// - Parameters:
    ///   - endpoint: defaults to .beers
    ///   - completion: returns a Result type of T
    public func fetchFromApi<T: Codable>(_ endpoint: Endpoints = .beers, completion: @escaping ((Result<T, Error>) -> Void)) {
        let env = BreweryNetworkEnviroment()
        let url = env.createUrl(endpoint: endpoint)
        self.fetchDecodable(url, completion: completion)
    }

}
