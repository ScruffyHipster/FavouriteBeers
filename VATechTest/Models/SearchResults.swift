//
//  SearchResults.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

// MARK: - SearchResults
struct SearchResults: Codable, Hashable {

    var id: UUID = UUID()
    let currentPage, numberOfPages, totalResults: Int
    let data: [Datum]
    let status: String


}

// MARK: - Datum
struct Datum: Codable, Hashable {
    let id, name, nameDisplay: String
    let abv: String?
    let glasswareID, styleID: Int?
    let createDate: String
    let datumDescription, ibu, originalGravity: String?
    let availableID: Int?
    let foodPairings: String?
    let year, srmID: Int?
    let servingTemperature, servingTemperatureDisplay: String?
}
