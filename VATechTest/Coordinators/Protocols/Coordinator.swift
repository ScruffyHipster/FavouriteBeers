//
//  Coordinator.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

/// Provides conformamc for protocols
protocol Coordinator: class {

    var children: [Coordinator]? { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
