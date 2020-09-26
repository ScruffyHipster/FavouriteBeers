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

final class TableViewDataSource: UITableViewDiffableDataSource<Section, Beer> {

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            //we'll handle deleting objects here
        break
        default:
            break
        }
    }

    // MARK: - Methods
    /// Set initial values for the data source
    /// - Parameter movies: an array of movie objects
    func setBeers(_ searches: [Beer]) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Beer>()
        snapShot.appendSections([Section.main])
        snapShot.appendItems(searches.map({ $0 }), toSection: .main)
        apply(snapShot, animatingDifferences: true)
    }

    /// Add additional beers to existing beers array
    /// - Parameter searches: an array of beer objects
    func appendBeers(_ searches: [Beer]) {
        var snapShot = snapshot()
        guard snapShot.sectionIdentifiers.contains(.main) else {
            print("⚠️ Section doesn't exist!!")
            return
        }
        snapShot.appendItems(searches.map({ $0 }), toSection: .main)
        apply(snapShot)
    }

    func beer(at index: Int) -> Beer? {
        let allMainItems = snapshot().itemIdentifiers(inSection: .main)
        return allMainItems[index]
    }

    func section(at index: Int) -> Section {
        let allSections = snapshot().sectionIdentifiers
        return allSections[index]
    }

    var hasAnyItems: Bool {
        let allItems = snapshot().itemIdentifiers
        return allItems.isEmpty == false
    }
    


}
