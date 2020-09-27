//
//  HomeView.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

protocol HomeViewDelegate: class {
    func didToggleFavourties(_ toggled: Bool)
}

final class HomeView: UIView {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favouritesSwitch: UISwitch!
    @IBOutlet weak var favouritesLabel: UILabel!

    // MARK: - Properties
    weak var homeTableViewDataSource: TableViewDataSource?
    weak var delegate: HomeViewDelegate?

    // MARK: - Actions
    @IBAction func didToggleFavourties(_ sender: UISwitch) {
        delegate?.didToggleFavourties(sender.isOn)
    }

}
