//
//  BaseChildCoordinatorFactory.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/20/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

protocol ApplicationChildCoordinatorFactory {
    func makeMapViewCoordinator(router: Router) -> MapViewCoordinator
}

class ApplicationChildCoordinatorFactoryImplementation: ApplicationChildCoordinatorFactory {
    func makeMapViewCoordinator(router: Router) -> MapViewCoordinator {
        let presentableFactory = MapViewPresentableFactoryImplementation()
        return MapViewCoordinatorImplementation(router: router, presentableFactory: presentableFactory)
    }
}
