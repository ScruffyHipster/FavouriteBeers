//
//  TableViewDatasource.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

enum Section {
    case main
}

/// Datasource for the home view controller, handles displaying beer objects
final class TableViewDataSource: UITableViewDiffableDataSource<Section, Beer> {

    // MARK: - Methods
    
    /// Set initial values for the data source
    /// - Parameter searches: an array of beer objects
    func setBeers(_ searches: [Beer]) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Beer>()
        snapShot.appendSections([Section.main])
        snapShot.appendItems(searches.map({ $0 }), toSection: .main)
        apply(snapShot, animatingDifferences: true)
    }

    func beer(at index: Int) -> Beer? {
        let allMainItems = snapshot().itemIdentifiers(inSection: .main)
        return allMainItems[index]
    }

    func section(at index: Int) -> Section {
        let allSections = snapshot().sectionIdentifiers
        return allSections[index]
    }

}
