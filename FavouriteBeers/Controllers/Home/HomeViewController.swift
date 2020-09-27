//
//  HomeViewController.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func requestData()
    func displayDataFor(_ beer: Beer)
    func saveBeer(_ beer: Beer)
    func toggleFavourtieBeers(_ toggle: Bool)
    func isBeerFavourite(_ beer: Beer) -> Bool
}

final class HomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak private var homeView: HomeView!

    // MARK: - Properties
    weak var delegate: HomeViewControllerDelegate?
    private var homeTableView: UITableView { homeView.tableView }
    private var tableViewDatasource: TableViewDataSource?

    // MARK: - Init methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDataSource()
        setUpHomeView()
        delegate?.requestData()
    }

    // MARK: - Methods
    private func setUpDataSource() {
        tableViewDatasource = TableViewDataSource(tableView: homeTableView, cellProvider: { tableView, indexPath, beer in
            let cell: HomeViewTableViewCell = tableView.dequeueCell(for: indexPath)
            cell.delegate = self
            cell.favourited = self.delegate?.isBeerFavourite(beer) ?? false
            cell.configureWith(beer)
            return cell
        })
    }

    private func setUpHomeView() {
        homeView.homeTableViewDataSource = tableViewDatasource
        homeView.delegate = self
        homeTableView.delegate = self
        homeTableView.dataSource = tableViewDatasource
    }

    func populateData(_ results: [Beer]) {
        tableViewDatasource?.setBeers(results)
    }

}

// MARK: - Storyboarded delegate
extension HomeViewController: Storyboarded {
    static var storyboardId: StoryboardIdentifiers { .main }
}

// MARK: - table view delegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let beer = tableViewDatasource?.beer(at: indexPath.row) else {
            //TODO: show an error to the user
            return
        }
        delegate?.displayDataFor(beer)
    }
}

// MARK: - home view delegate
extension HomeViewController: HomeViewDelegate {
    func didToggleFavourties(_ toggled: Bool) {
        delegate?.toggleFavourtieBeers(toggled)
    }
}

// MARK: - table view cell delegate
extension HomeViewController: TableViewCellDelegate {
    func didFavourtieBeer(_ beer: Beer?) {
        guard let beer = beer else {
            print("🍺 not saved")
            return
        }
        delegate?.saveBeer(beer)
    }
}
