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
    var beer: BeerData?

    // MARK: - Init methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

    func configureView() {
        beerInfoView.beerTitle.text = beer?.name
        beerInfoView.beerInfo.text = beer?.dataDescription
    }

    // MARK: - Methods


}

extension BeerInfoViewController: Storyboarded {
    static var storyboardId: StoryboardIdentifiers { .main }
}
