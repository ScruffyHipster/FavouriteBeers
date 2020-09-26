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
    var detailsResultsManager: BreweryResultsManager<Beer>?

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
         detailsResultsManager: BreweryResultsManager<Beer> = BreweryResultsManager()
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
                self.startBeerInfoViewController(result)
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

    private func startBeerInfoViewController(_ result: Beer) {
        beerInfoViewController.configureWith(result)
        navigationController.pushViewController(beerInfoViewController, animated: true)
    }

    private func setUpNavControllerApperance(_ title: String = "Beers") {
        homeController.title = title
        navigationController.modalPresentationStyle = .overFullScreen
    }

}

// MARK: - BeerInfoViewController Delegate
extension HomeCoordinator: BeerInfoViewControllerDelegate {
    func doSomething() {
        print("do something")
    }


}

// MARK: - HomeViewController Delegate
extension HomeCoordinator: HomeViewControllerDelegate {
    func requestData() {
        resultsManager?.search(endpoint: .beers)
    }
}
