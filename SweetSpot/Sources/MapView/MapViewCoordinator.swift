//
//  MapViewCoordinator.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/18/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

protocol MapViewCoordinator: Coordinator {
    var didFinish: (() -> Void)? { get set }
    func start()
}

class MapViewCoordinatorImplementation: MapViewCoordinator {
    
    // MARK: - Properties
    
    private let router: Router
    private let presentableFactory: MapViewPresentableFactory

    var didFinish: (() -> Void)?
    
    // MARK: - Initialization
    
    init(router: Router, presentableFactory: MapViewPresentableFactory) {
        self.router = router
        self.presentableFactory = presentableFactory
    }
    
    // MARK: - Public

    func start() {
        guard let mapViewPresentable = presentableFactory.makeMapViewPresentable() else { return }
        router.setRootPresentable(mapViewPresentable)
    }
}
