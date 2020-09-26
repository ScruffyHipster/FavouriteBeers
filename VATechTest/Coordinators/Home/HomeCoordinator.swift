//
//  HomeCoordinator.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

/// Home coordinator which handles the requests from home view controller
final class HomeCoordinator: Coordinator {

    // MARK: - Properties
    var children: [Coordinator]?

    var navigationController: UINavigationController
    var resultsManager: BreweryResultsManager<SearchResults>?

    var beers: [Beer] = []
    var favourtieBeers: [Beer] = []

    lazy var homeController: HomeViewController = {
        var controller = HomeViewController.instantiate()
        controller.delegate = self
        return controller
    }()

    // MARK: - Init methods
    init(navController: UINavigationController = UINavigationController(),
         resultsManager: BreweryResultsManager<SearchResults> = BreweryResultsManager()
         ) {
        self.navigationController = navController
        self.resultsManager = resultsManager
    }

    // MARK: - Methods
    func start() {
        setUpHandlers()
        initHomeController()
    }

    /// Set up handles for api calls
    private func setUpHandlers() {
        resultsManager?.resultsHandler = { [weak self] in
            guard let self = self else { return }
            switch $0 {
            case .success(let results):
                self.beers = results.data
                self.homeController.populateData(self.beers)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func initHomeController() {
        homeController.delegate = self
        navigationController.pushViewController(homeController, animated: true)
    }

    private func showBeerInfoViewController(_ result: Beer) {
        let controller = BeerInfoViewController.instantiate()
        controller.delegate = self
        controller.beer = result
        self.navigationController.pushViewController(controller, animated: true)
    }

}

// MARK: - HomeViewController Delegate
extension HomeCoordinator: HomeViewControllerDelegate {

    func toggleFavourtieBeers(_ toggle: Bool) {
        if toggle {
            homeController.populateData(favourtieBeers)
        } else {
            homeController.populateData(beers)
        }
    }

    func saveBeer(_ beer: Beer) {
        favourtieBeers.append(beer)
    }

    func displayDataFor(_ beer: Beer) {
        showBeerInfoViewController(beer)
    }

    /// Makes the inital data request
    func requestData() {
        resultsManager?.search(endpoint: .beers)
    }

}

// MARK: - BeerInfoViewController Delegate
extension HomeCoordinator: BeerInfoViewControllerDelegate {
    func didFavourtieBeer(_ beer: Beer) {
        favourtieBeers.append(beer)
    }

}
