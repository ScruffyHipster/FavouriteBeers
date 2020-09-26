//
//  BeerInfoViewController.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

protocol BeerInfoViewControllerDelegate: class {
    func doSomething()
}

final class BeerInfoViewController: UIViewController {

    @IBOutlet weak var beerInfoView: BeerInfoView!
    
    // MARK: - Properties
    weak var delegate: BeerInfoViewControllerDelegate?

    // MARK: - Init methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Methods


}

extension BeerInfoViewController: Storyboarded {
    static var storyboardId: StoryboardIdentifiers { .beerInfo }
}
