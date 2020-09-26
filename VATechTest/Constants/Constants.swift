//
//  Constants.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

// MARK: - Storyboard identifiers
enum StoryboardIdentifiers: String {
    case home = "HomeViewController"
    case beerInfo = "BeerInfoViewController"

    var identifier: String { rawValue }

    static func access(storyboard: Self) -> UIStoryboard {
        UIStoryboard(name: storyboard.rawValue, bundle: nil)
    }

}
