//
//  UserDefaultsManager.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

enum UserDefaultsError: Error {
    case noObjectForTerm
}

/// Provides conformnace for a user defaults manager
protocol UserDefaultsManagerProtocol {
    associatedtype Object
    var userDefaults: UserDefaults { get set }
    var defaultsReturnDataHandler: (([Object]?, UserDefaultsError?) -> Void) { get set }
}


class UserDefaultsManager<T>: UserDefaultsManagerProtocol {

    // MARK: - Propeties
    var userDefaults: UserDefaults
    var total: Int
    var defaultsReturnDataHandler: (([T]?, UserDefaultsError?) -> Void)

    // MARK: - Init methods

    /// Init method for user defaults manager
    /// - Parameters:
    ///   - userDefaults: the user defaults instance, defautls to standard
    ///   - total: the total amount of objects to store
    ///   - closure: used as the return data handler
    init(userDefaults: UserDefaults = .standard, total: Int = 20, closure: @escaping (([T]?, UserDefaultsError?) -> Void)) {
        self.userDefaults = userDefaults
        self.total = total
        self.defaultsReturnDataHandler = closure
    }
}


/// Handler for using userdefaults with Beer objects
final class BeerUserDefaultsManager: UserDefaultsManager<Beer> {
    // MARK: - Methods

    /// Will save a beer
    /// - Parameter term: movie search term
    func save(_ object: Beer) {
        userDefaults.saveItem(object, total: total)
    }

    /// Retrive objects
    /// - Parameter key: value of objects
    func retriveObjectsFor(key: String) {
        guard let data = userDefaults.value(forKey: key) as? Data else {
            defaultsReturnDataHandler(nil, UserDefaultsError.noObjectForTerm)
            return
        }
        let objects = try? PropertyListDecoder().decode([Beer].self, from: data)
        defaultsReturnDataHandler(objects, nil)
    }

    /// Deletes an object from array at specified index
    /// - Parameters:
    ///   - index: index in which to remove at
    ///   - key: key for object array
    func deleteObject(index: Int, key: String) {
        guard let data = userDefaults.value(forKey: key) as? Data else {
            defaultsReturnDataHandler(nil, UserDefaultsError.noObjectForTerm)
            return
        }
        var objects = try? PropertyListDecoder().decode([Beer].self, from: data)
        objects?.remove(at: index)
        userDefaults.updateWith(objects ?? [], key: key)
    }
}

