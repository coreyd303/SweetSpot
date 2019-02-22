//
//  BasePresentableFactory.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/20/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol BasePresentableFactory: class {
    func makeRouter() -> Router
}

class BasePresentableFactoryImplementation: BasePresentableFactory {
    func makeRouter() -> Router {
        let navigationController = UINavigationController()
        navigationController.navigationBar.barTintColor = Color.Flat.Green.marianas
        navigationController.navigationBar.prefersLargeTitles = true
        return RouterImplementation(rootController: navigationController)
    }
}
