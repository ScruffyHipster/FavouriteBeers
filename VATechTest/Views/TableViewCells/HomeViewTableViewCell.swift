//
//  HomeViewTableViewCell.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

class HomeViewTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!

    func configureWith(_ data: String) {
        title.text = data
    }

}
