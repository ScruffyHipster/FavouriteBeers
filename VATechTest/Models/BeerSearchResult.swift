//
//  BeerSearchResult.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import Foundation

// MARK: - BeerSearchResult
struct BeerSearchResult: Codable {
    let message: String
    let data: BeerData
    let status: String
}

// MARK: - DataClass
struct BeerData: Codable {
    let id, name, nameDisplay, dataDescription: String
    let abv, ibu: String
    let styleID: Int
    let isOrganic, isRetired: String
    let labels: BeerLabels
    let status, statusDisplay, createDate, updateDate: String
    let style: BeerStyle

    enum CodingKeys: String, CodingKey {
        case id, name, nameDisplay
        case dataDescription = "description"
        case abv, ibu
        case styleID = "styleId"
        case isOrganic, isRetired, labels, status, statusDisplay, createDate, updateDate, style
    }
}

// MARK: - Labels
struct BeerLabels: Codable {
    let icon, medium, large, contentAwareIcon: String
    let contentAwareMedium, contentAwareLarge: String
}

// MARK: - Style
struct BeerStyle: Codable {
    let id, categoryID: Int
    let category: Category
    let name, shortName, styleDescription, ibuMin: String
    let ibuMax, abvMin, abvMax, srmMin: String
    let srmMax, ogMin, fgMin, fgMax: String
    let createDate, updateDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case categoryID = "categoryId"
        case category, name, shortName
        case styleDescription = "description"
        case ibuMin, ibuMax, abvMin, abvMax, srmMin, srmMax, ogMin, fgMin, fgMax, createDate, updateDate
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name, createDate: String
}
