//
//  SearchResults.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

// MARK: - SearchResults
struct SearchResults: Codable, Hashable {

    let currentPage, numberOfPages, totalResults: Int
    let data: [Beer]
    let status: String
}

// MARK: - Datum
struct Beer: Codable, Hashable {
    let id, name, nameDisplay: String
    let abv: String?
    let glasswareID, styleID: Int?
    let isOrganic, isRetired: Is
    let labels: Labels?
    let status: Status
    let statusDisplay: StatusDisplay
    let createDate: String
    let updateDate: UpdateDate
    let glass: Glass?
    let style: Style?
    let datumDescription, ibu, originalGravity: String?
    let availableID: Int?
    let foodPairings: String?
    let available: Available?
    let year, srmID: Int?
    let srm: Srm?
    let servingTemperature, servingTemperatureDisplay: String?

    enum CodingKeys: String, CodingKey {
        case id, name, nameDisplay, abv
        case glasswareID = "glasswareId"
        case styleID = "styleId"
        case isOrganic, isRetired, labels, status, statusDisplay, createDate, updateDate, glass, style
        case datumDescription = "description"
        case ibu, originalGravity
        case availableID = "availableId"
        case foodPairings, available, year
        case srmID = "srmId"
        case srm, servingTemperature, servingTemperatureDisplay
    }
}

// MARK: - Available
struct Available: Codable, Hashable {
    let id: Int
    let name: Name
    let availableDescription: Description

    enum CodingKeys: String, CodingKey {
        case id, name
        case availableDescription = "description"
    }
}

enum Description: String, Codable, Hashable {
    case availableAtTheSameTimeOfYearEveryYear = "Available at the same time of year, every year."
    case availableYearRoundAsAStapleBeer = "Available year round as a staple beer."
    case beerIsNotCurrentlyAvailable = "Beer is not currently available."
    case limitedAvailability = "Limited availability."
}

enum Name: String, Codable, Hashable {
    case limited = "Limited"
    case notAvailable = "Not Available"
    case seasonal = "Seasonal"
    case yearRound = "Year Round"
}

// MARK: - Glass
struct Glass: Codable, Hashable {
    let id: Int
    let name: String
    let createDate: GlassCreateDate
}

enum GlassCreateDate: String, Codable, Hashable {
    case the20120103024133 = "2012-01-03 02:41:33"
    case the20120321200645 = "2012-03-21 20:06:45"
    case the20120321200646 = "2012-03-21 20:06:46"
}

enum Is: String, Codable, Hashable {
    case n = "N"
    case y = "Y"
}

// MARK: - Labels
struct Labels: Codable, Hashable {
    let icon, medium, large: String
    let contentAwareIcon, contentAwareMedium, contentAwareLarge: String?
}

// MARK: - Srm
struct Srm: Codable, Hashable {
    let id: Int
    let name, hex: String
}

enum Status: String, Codable {
    case verified = "verified"
}

enum StatusDisplay: String, Codable {
    case verified = "Verified"
}

// MARK: - Style
struct Style: Codable, Hashable {
    let id, categoryID: Int
    let category: Glass
    let name, shortName, styleDescription: String
    let ibuMin, ibuMax, abvMin, abvMax: String?
    let srmMin, srmMax, ogMin, fgMin: String?
    let fgMax: String?
    let createDate: StyleCreateDate
    let updateDate, ogMax: String?

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "categoryId"
        case category, name, shortName
        case styleDescription = "description"
        case ibuMin, ibuMax, abvMin, abvMax, srmMin, srmMax, ogMin, fgMin, fgMax, createDate, updateDate, ogMax
    }
}

enum StyleCreateDate: String, Codable {
    case the20120321200645 = "2012-03-21 20:06:45"
    case the20120321200646 = "2012-03-21 20:06:46"
    case the20130810124251 = "2013-08-10 12:42:51"
    case the20150407170727 = "2015-04-07 17:07:27"
}

enum UpdateDate: String, Codable {
    case the20181102021514 = "2018-11-02 02:15:14"
}
