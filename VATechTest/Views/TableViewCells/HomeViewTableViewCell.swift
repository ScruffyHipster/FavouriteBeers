//
//  HomeViewTableViewCell.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

protocol TableViewCellDelegate: class {
    func didFavourtieBeer(_ beer: Beer?)
}

/// Home view table view cell, displays object name and favourite button
final class HomeViewTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var favourtieButton: UIButton!

    // MARK: - Actions
    @IBAction func didFavourtieBeer(_ sender: UIButton) {
        toggleFavouriteIcon()
    }

    // MARK: - Properties
    weak var delegate: TableViewCellDelegate?
    private var beer: Beer?
    private var favourited: Bool = false

    // MARK: - Methods

    func configureWith(_ data: Beer) {
        beer = data
        title.text = data.name
    }

    private func toggleFavouriteIcon() {
        favourited = !favourited
        print(favourited)
        favourtieButton.setImage(UIImage(systemName: favourited ? "heart.fill" : "heart"), for: .normal)
        delegate?.didFavourtieBeer(beer ?? nil)
    }

}
