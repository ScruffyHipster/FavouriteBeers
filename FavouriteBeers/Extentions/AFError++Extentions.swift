//
//  AFError++Extentions.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation
import Alamofire

// MARK: - AFError + swiftError
extension AFError {
    var swiftError: Error {
        return self as Swift.Error
    }
}

