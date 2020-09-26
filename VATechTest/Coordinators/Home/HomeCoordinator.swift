//
//  HomeCoordinator.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

class HomeCoordinator: Coordinator {

    // MARK: - Properties
    var children: [Coordinator]?

    var navigationController: UINavigationController
    var resultsManager: BreweryResultsManager<SearchResults>?
    var detailsResultsManager: BreweryResultsManager<BeerSearchResult>?

    lazy var homeController: HomeViewController = {
        var controller = HomeViewController.instantiate()
        controller.delegate = self
        return controller
    }()

    lazy var beerInfoViewController: BeerInfoViewController = {
        var controller = BeerInfoViewController.instantiate()
        controller.delegate = self
        return controller
    }()

    // MARK: - Init methods
    init(navController: UINavigationController = UINavigationController(),
         resultsManager: BreweryResultsManager<SearchResults> = BreweryResultsManager(),
         detailsResultsManager: BreweryResultsManager<BeerSearchResult> = BreweryResultsManager()
         ) {
        self.navigationController = navController
        self.resultsManager = resultsManager
        self.detailsResultsManager = detailsResultsManager
    }

    // MARK: - Methods

    func start() {
        setUpHandlers()
        setUpNavControllerApperance()
        initHomeController()

    }

    private func setUpHandlers() {
        resultsManager?.resultsHandler = {
            switch $0 {
            case .success(let results):
                self.homeController.populateData(results.data)
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }

        detailsResultsManager?.resultsHandler = {
            switch $0 {
            case .success(let result):
                print(result)
                DispatchQueue.main.async {
                    self.startBeerInfoViewController(result.data)
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }

    }

    private func initHomeController() {
        homeController.delegate = self
        navigationController.pushViewController(homeController, animated: true)
    }

    private func startBeerInfoViewController(_ result: BeerData) {
        beerInfoViewController.beer = result
        self.navigationController.pushViewController(self.beerInfoViewController, animated: true)
    }

    private func setUpNavControllerApperance(_ title: String = "Beers") {
        homeController.title = title
        navigationController.modalPresentationStyle = .overFullScreen
    }

}

// MARK: - HomeViewController Delegate
extension HomeCoordinator: HomeViewControllerDelegate {

    func displayDataFor(_ beerId: String) {
        detailsResultsManager?.search(endpoint: .beer(beerId))
    }

    /// Makes the inital data request
    func requestData() {
        resultsManager?.search(endpoint: .beers)
    }

}

// MARK: - BeerInfoViewController Delegate
extension HomeCoordinator: BeerInfoViewControllerDelegate {
    func doSomething() {
        print("do something")
    }

}
