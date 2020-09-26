//
//  Constants.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

struct Constants {

    // MARK: - Static Strings
    static let apiKey = "API_KEY"
    static let baseURL = "BASE_URL"

}

// MARK: - Storyboard identifiers
enum StoryboardIdentifiers: String {
    case main = "Main"

    var identifier: String { rawValue }

    static func access(storyboard: Self) -> UIStoryboard {
        UIStoryboard(name: storyboard.rawValue, bundle: nil)
    }

}

enum Endpoints {
    case beers
    case beer(String)

    var endpoint: String {
        switch self {
        case .beers:
            return "beers"
        case .beer(let id):
            return "beer/\(id)"
        }
    }
}
