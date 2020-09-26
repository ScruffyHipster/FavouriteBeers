//
//  HomeView.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

class HomeView: UIView {

    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favouritesSwitch: UISwitch!
    @IBOutlet weak var favouritesLabel: UILabel!

    // MARK: - Properties
    weak var homeTableViewDataSource: TableViewDataSource?


}
