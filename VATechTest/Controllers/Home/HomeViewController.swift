//
//  HomeViewController.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func requestData()
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
            print(beer.name)
            cell.configureWith(beer.name)
            return cell
        })
    }

    private func setUpHomeView() {
        homeView.homeTableViewDataSource = tableViewDatasource
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

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //do something with the delegate to open the beer info view controller
    }
}
