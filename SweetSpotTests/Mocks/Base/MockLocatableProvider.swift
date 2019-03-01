//
//  MockLocatableProvider.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import CoreLocation

@testable import SweetSpot

class MockLocatableProvider: LocatableProvider {
    var invokedIsEnabledGetter = false
    var invokedIsEnabledGetterCount = 0
    var stubbedIsEnabled: Bool! = false
    var isEnabled: Bool {
        invokedIsEnabledGetter = true
        invokedIsEnabledGetterCount += 1
        return stubbedIsEnabled
    }
    var invokedIsUserAuthorizedGetter = false
    var invokedIsUserAuthorizedGetterCount = 0
    var stubbedIsUserAuthorized: Bool! = false
    var isUserAuthorized: Bool {
        invokedIsUserAuthorizedGetter = true
        invokedIsUserAuthorizedGetterCount += 1
        return stubbedIsUserAuthorized
    }
    var invokedDelegateSetter = false
    var invokedDelegateSetterCount = 0
    var invokedDelegate: CLLocationManagerDelegate?
    var invokedDelegateList = [CLLocationManagerDelegate?]()
    var invokedDelegateGetter = false
    var invokedDelegateGetterCount = 0
    var stubbedDelegate: CLLocationManagerDelegate!
    var delegate: CLLocationManagerDelegate? {
        set {
            invokedDelegateSetter = true
            invokedDelegateSetterCount += 1
            invokedDelegate = newValue
            invokedDelegateList.append(newValue)
        }
        get {
            invokedDelegateGetter = true
            invokedDelegateGetterCount += 1
            return stubbedDelegate
        }
    }
    var invokedRequestWhenInUseAuthorization = false
    var invokedRequestWhenInUseAuthorizationCount = 0
    func requestWhenInUseAuthorization() {
        invokedRequestWhenInUseAuthorization = true
        invokedRequestWhenInUseAuthorizationCount += 1
    }
    var invokedRequestLocation = false
    var invokedRequestLocationCount = 0
    func requestLocation() {
        invokedRequestLocation = true
        invokedRequestLocationCount += 1
    }
    var invokedStartUpdatingLocation = false
    var invokedStartUpdatingLocationCount = 0
    func startUpdatingLocation() {
        invokedStartUpdatingLocation = true
        invokedStartUpdatingLocationCount += 1
    }
    var invokedStopUpdatingLocation = false
    var invokedStopUpdatingLocationCount = 0
    func stopUpdatingLocation() {
        invokedStopUpdatingLocation = true
        invokedStopUpdatingLocationCount += 1
    }
}
