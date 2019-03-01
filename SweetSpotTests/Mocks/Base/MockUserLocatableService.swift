//
//  MockUserLocatableService.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

@testable import SweetSpot

class MockUserLocatableService: UserLocatableService {
    var invokedFindUserLocation = false
    var invokedFindUserLocationCount = 0
    var stubbedFindUserLocationThenResult: (Result<Locatable>, Void)?
    override func findUserLocation(then: @escaping UserLocatableCompletionBlock) {
        invokedFindUserLocation = true
        invokedFindUserLocationCount += 1
        if let result = stubbedFindUserLocationThenResult {
            then(result.0)
        }
    }
    var invokedStartUpdatingLocation = false
    var invokedStartUpdatingLocationCount = 0
    override func startUpdatingLocation() {
        invokedStartUpdatingLocation = true
        invokedStartUpdatingLocationCount += 1
    }
    var invokedStopUpdatingLocation = false
    var invokedStopUpdatingLocationCount = 0
    override func stopUpdatingLocation() {
        invokedStopUpdatingLocation = true
        invokedStopUpdatingLocationCount += 1
    }
}
