//
//  MapViewModel.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

protocol MapViewModel: class {
    var regionRadius: Double { get }
    var locationProvider: UserLocatableService { get }
    func verifyPermissions(completion: (Result<Bool>) -> Void)
    func requestLocationUpdates()
    func requestLocation(completion: @escaping (Result<Locatable>) -> Void)
}

class MapViewModelImplementation: MapViewModel {
    
    var regionRadius: Double = 1000
    var currentLocation: Locatable?
    var locationProvider: UserLocatableService
    
    init(locationProvider: UserLocatableService) {
        self.locationProvider = locationProvider
    }
    
    func verifyPermissions(completion: (Result<Bool>) -> Void) {
        if let locationProvider = locationProvider as? LocatableProvider {
            completion(.success(locationProvider.isUserAuthorized))
        }
        completion(.failure(UserLocatableError.notAllowed))
    }

    func requestLocationUpdates() {
        locationProvider.startUpdatingLocation()
    }
    
    func requestLocation(completion: @escaping (Result<Locatable>) -> Void) {
        locationProvider.findUserLocation { result in
            completion(result)
        }
    }
}

