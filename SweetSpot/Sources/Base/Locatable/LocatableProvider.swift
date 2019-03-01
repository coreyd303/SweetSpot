//
//  LocatableProvider.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocatableProvider {
    var isEnabled: Bool { get }
    var isUserAuthorized: Bool { get }
    var delegate: CLLocationManagerDelegate? { get set }
    func requestWhenInUseAuthorization()
    func requestLocation()
    func startUpdatingLocation()
    func stopUpdatingLocation()
}

extension CLLocationManager: LocatableProvider {
    var isEnabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }

    var isUserAuthorized: Bool {
        if isEnabled {
            return CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways
        }
        return false
    }
}
