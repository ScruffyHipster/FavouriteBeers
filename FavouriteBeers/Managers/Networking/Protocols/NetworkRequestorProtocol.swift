//
//  NetworkRequestorProtocol.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation
import Alamofire

/// Provides methods for network request managers
protocol NetworkRequestorProtocol {
    var session: Session { get set }
    init(session: Session)

    func fetchDecodable<T: Decodable>(_ url: String, completion: @escaping (Result<T, Swift.Error>) -> Swift.Void)
}
