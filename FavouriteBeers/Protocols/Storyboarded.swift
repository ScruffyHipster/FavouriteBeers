//
//  Storyboarded.swift
//  VATechTest
//
//  Created by Thomas Murray on 26/09/2020.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
    static var storyboardId: StoryboardIdentifiers { get }
}

extension Storyboarded where Self: UIViewController {

    /// Instantiates the controller this is called upon
    /// - Returns: a type which is a subcless of UIViewController
    static func instantiate() -> Self {
        //Get the name of the class from the controller eg: MyApp.ViewController
        let fullName = NSStringFromClass(self)
        //This removes the name post . so will return the view controller name
        let className = fullName.components(separatedBy: ".")[1]
        //get the storyboard as we do not use a intial entry point
        let storyboard = UIStoryboard(name: self.storyboardId.rawValue,
                                      bundle: Bundle.main)
        //load the view controller into the storyboard
        // swiftlint:disable:next force_cast
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

