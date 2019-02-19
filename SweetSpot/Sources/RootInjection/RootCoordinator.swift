//
//  RootViewCoordinator.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol RootCoordinator: Coordinator {
    
}

class RootCoordinatorImplementation: RootCoordinator {
    var childCoordinator: Coordinator?

    init() {
        start()
    }
    
    func start() {
        childCoordinator?.start()
    }
    
    func transitionWith<T: Coordinator>(_ coordinator: T) {
        childCoordinator = coordinator
        childCoordinator?.start()
    }
}
