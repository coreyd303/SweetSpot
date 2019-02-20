//
//  RootViewCoordinator.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol ApplicationCoordinator: Coordinator {
   
}

class ApplicationCoordinatorImplementation: BaseCoordinator, ApplicationCoordinator {
    let window: WindowProviding
    let childCoordinatorFactory: ApplicationChildCoordinatorFactory
    let basePresentableFactory: BasePresentableFactory
    private let router: Router

    private var currentState: ApplicationState = .launching
    

    init(window: WindowProviding, childCoordinatorFactory: ApplicationChildCoordinatorFactory, basePresentableFactory: BasePresentableFactory) {
        self.window = window
        self.childCoordinatorFactory = childCoordinatorFactory
        self.basePresentableFactory = basePresentableFactory
        self.router = basePresentableFactory.makeRouter()
    }
    
    override func start() {
        if currentState == .launching {
            startSweetSpot()
        } else {
            present(currentState)
        }
    }

    private func startSweetSpot() {
        window.setRootPresentable(router)
        present(currentState)
    }
    
    private func present(_ applicationState: ApplicationState) {
        switch applicationState {
        case .launching:
            currentState = .signedIn(userSession: nil)
            // will need a launching coordinator, and when it didFinish, it will transition the state and call start on this coordinator
            start()
            return
        case .onboarding:
            // will need an onboarding coordinator, and when it didFinish, it will transition the state and call start on this coordinator
            return
        case .signUp:
            // will need a signUp coordinator, and when it didFinish, it will transition the state and call start on this coordinator
            return
        case .signedIn(let userSession): // TODO: - not sure that this actually needs to have a session passed through to here
            let mapViewCoordinator = childCoordinatorFactory.makeMapViewCoordinator(router: router)
            addDependency(mapViewCoordinator)
            mapViewCoordinator.didFinish = { [weak self] in
                self?.removeDependency(mapViewCoordinator)
            }
            mapViewCoordinator.start()
        case .signOut:
            return
        }
        // TODO: - what knows about the state?
        
        
    }
    
//    func transitionWith<T: Coordinator>(_ coordinator: T) {
//        childCoordinator = coordinator
//        childCoordinator?.start()
//    }
}

