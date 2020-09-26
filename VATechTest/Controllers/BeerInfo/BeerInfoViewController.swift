//
//  BeerInfoViewController.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit
import Kingfisher

protocol BeerInfoViewControllerDelegate: class {
    func didFavourtieBeer(_ beer: Beer)
}

/// Displays the beer related info
final class BeerInfoViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var beerInfoView: BeerInfoView!
    
    // MARK: - Properties
    weak var delegate: BeerInfoViewControllerDelegate?
    var beer: Beer?

    // MARK: - Actions
    @IBAction func didTapFavouriteButton(_ sender: UIButton) {
        guard let beer = beer else { return }
        delegate?.didFavourtieBeer(beer)
    }

    // MARK: - Init methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }

    // MARK: - Methods
    func configureView() {
        beerInfoView.beerTitle.text = beer?.name
        beerInfoView.beerInfo.text = beer?.datumDescription
        guard let url = URL(string: beer?.labels?.medium ?? "") else { return }
        beerInfoView.beerImage.kf.setImage(with: url)
    }

}

extension BeerInfoViewController: Storyboarded {
    static var storyboardId: StoryboardIdentifiers { .main }
}
