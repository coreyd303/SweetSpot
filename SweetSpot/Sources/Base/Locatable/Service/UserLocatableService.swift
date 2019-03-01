//
//  UserLocatableService.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import CoreLocation

class UserLocatableService: NSObject, UserLocatableProvider {
    private var provider: LocatableProvider
    private var locatableCompletionBlock: UserLocatableCompletionBlock?
    
    // MARK: - Initialization
    
    init(provider: LocatableProvider) {
        self.provider = provider
    }

    // MARK: - Public

    func findUserLocation(then: @escaping UserLocatableCompletionBlock) {
        locatableCompletionBlock = then
        provider.delegate = self
        if provider.isUserAuthorized {
            provider.requestLocation()
        } else {
            provider.requestWhenInUseAuthorization()
        }
        provider.startUpdatingLocation()
    }
    
    func startUpdatingLocation() {
        provider.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        provider.stopUpdatingLocation()
    }
}

extension UserLocatableService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            provider.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        if let location = locations.last {
            locatableCompletionBlock?(.success(location))
        } else {
            locatableCompletionBlock?(.failure(UserLocatableError.cannotFindLocation))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error)")
    }
}
