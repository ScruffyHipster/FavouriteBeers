//
//  Results++Extentions.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation
import Alamofire

// MARK: - Result + swiftError
extension Result where Failure == AFError {
    var swiftError: Result<Success, Error> {
        return self.mapError{$0.swiftError}
    }
}
