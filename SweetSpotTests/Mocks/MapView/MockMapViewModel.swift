//
//  MockMapViewModel.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

@testable import SweetSpot

class MockMapViewModel: MapViewModel {
    var invokedRegionRadiusGetter = false
    var invokedRegionRadiusGetterCount = 0
    var stubbedRegionRadius: Double! = 0
    var regionRadius: Double {
        invokedRegionRadiusGetter = true
        invokedRegionRadiusGetterCount += 1
        return stubbedRegionRadius
    }
    var invokedLocationProviderGetter = false
    var invokedLocationProviderGetterCount = 0
    var stubbedLocationProvider: UserLocatableService!
    var locationProvider: UserLocatableService {
        invokedLocationProviderGetter = true
        invokedLocationProviderGetterCount += 1
        return stubbedLocationProvider
    }
    var invokedVerifyPermissions = false
    var invokedVerifyPermissionsCount = 0
    var stubbedVerifyPermissionsCompletionResult: (Result<Bool>, Void)?
    func verifyPermissions(completion: (Result<Bool>) -> Void) {
        invokedVerifyPermissions = true
        invokedVerifyPermissionsCount += 1
        if let result = stubbedVerifyPermissionsCompletionResult {
            completion(result.0)
        }
    }
    var invokedRequestLocationUpdates = false
    var invokedRequestLocationUpdatesCount = 0
    func requestLocationUpdates() {
        invokedRequestLocationUpdates = true
        invokedRequestLocationUpdatesCount += 1
    }
    var invokedRequestLocation = false
    var invokedRequestLocationCount = 0
    var stubbedRequestLocationCompletionResult: (Result<Locatable>, Void)?
    func requestLocation(completion: @escaping (Result<Locatable>) -> Void) {
        invokedRequestLocation = true
        invokedRequestLocationCount += 1
        if let result = stubbedRequestLocationCompletionResult {
            completion(result.0)
        }
    }
}
