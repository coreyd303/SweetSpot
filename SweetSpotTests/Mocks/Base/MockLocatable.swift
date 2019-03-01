//
//  MockLocatable.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

@testable import SweetSpot

class MockLocatable: Locatable {
    var invokedCoordinateGetter = false
    var invokedCoordinateGetterCount = 0
    var stubbedCoordinate: Coordinate!
    var coordinate: Coordinate {
        invokedCoordinateGetter = true
        invokedCoordinateGetterCount += 1
        return stubbedCoordinate
    }
}
