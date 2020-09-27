//
//  UserDefaults++Extentions.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

extension UserDefaults {

    /// Saves  the objects . Will remove the last value if greater than 3
    /// - Parameter term: Search term of type String
    func saveItem(_ term: Beer, total: Int = 10) {
        guard let data = value(forKey: Constants.UserDefaultsIdentifiers.favouriteBeers.id) as? Data else {
            self.set(try? PropertyListEncoder().encode([term]), forKey: Constants.UserDefaultsIdentifiers.favouriteBeers.id)
            return
        }
        let previousSearches = try? PropertyListDecoder().decode([Beer].self, from: data)
        guard var previousSearchesArray = previousSearches else {
            print("An error occured fetching existing searches")
            return
        }
        if !previousSearchesArray.isEmpty {
            previousSearchesArray.insert(term, at: 0)
            if previousSearchesArray.count > total {
                previousSearchesArray.removeLast()
            }
            updateWith(previousSearchesArray, key: Constants.UserDefaultsIdentifiers.favouriteBeers.id)
        }
    }

    /// updates the user defaults with the passed array
    /// - Parameters:
    ///   - data: the data to overwrite the current data linked to key
    ///   - key: description key
    func updateWith(_ data: [Any], key: String) {
        self.set(try? PropertyListEncoder().encode(data as? [Beer]), forKey: key)
    }

}
