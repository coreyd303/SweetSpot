//
//  MapViewCoordinator.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/18/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

protocol MapViewCoordinator: Coordinator {
    var didTapAddButton: (() -> Void)? { get set }
    var didTapProfileButton: (() -> Void)? { get set }
    var didFinish: (() -> Void)? { get set }
    func start()
}

class MapViewCoordinatorImplementation: MapViewCoordinator {
    
    // MARK: - Properties
    
    private let router: Router
    private let presentableFactory: MapViewPresentableFactory
    
    var didTapAddButton: (() -> Void)?
    var didTapProfileButton: (() -> Void)?
    var didFinish: (() -> Void)?
    
    // MARK: - Initialization
    
    init(router: Router, presentableFactory: MapViewPresentableFactory) {
        self.router = router
        self.presentableFactory = presentableFactory
    }
    
    // MARK: - Public

    func start() {
        let mapViewPresentable = presentableFactory.makeMapViewPresentable()
        router.setRootPresentable(mapViewPresentable)
    }
}
