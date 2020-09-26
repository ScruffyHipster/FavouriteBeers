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

    lazy var homeController: HomeViewController = {
        var controller = HomeViewController.instantiate()
        controller.delegate = self
        return controller
    }()

    lazy var beerInfoViewContrller: BeerInfoViewController = {
        var controller = BeerInfoViewController.instantiate()
        controller.delegate = self
        return controller
    }()

    // MARK: - Init methods
    init(navController: UINavigationController = UINavigationController()) {
        self.navigationController = navController
    }

    // MARK: - Methods

    func start() {
        initHomeController()
    }

    private func initHomeController() {
        setUpNavControllerApperance()
        homeController.delegate = self
        navigationController.pushViewController(homeController, animated: true)
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
        print("Doing something")
    }
}
