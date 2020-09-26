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
    var resultsManager: BreweryResultsManager<[SearchResults]>?
    var detailsResultsManager: BreweryResultsManager<SearchResults>?

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
         resultsManager: BreweryResultsManager<[SearchResults]> = BreweryResultsManager(),
         detailsResultsManager: BreweryResultsManager<SearchResults> = BreweryResultsManager()
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
                print(results)
                self.homeController.populateData(results)
                break
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

    func startBeerInfoViewController(_ result: SearchResults) {
        beerInfoViewController.configureWith(result)
        navigationController.pushViewController(beerInfoViewController, animated: true)
    }

    private func setUpNavControllerApperance() {
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.navigationBar.isHidden = true
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
