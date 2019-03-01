//
//  MockMapViewPresentableFactory.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

@testable import SweetSpot

class MockMapViewPresentableFactory: MapViewPresentableFactory {
    var invokedMakeMapViewPresentable = false
    var invokedMakeMapViewPresentableCount = 0
    var stubbedMakeMapViewPresentableResult: Presentable!
    func makeMapViewPresentable() -> Presentable? {
        invokedMakeMapViewPresentable = true
        invokedMakeMapViewPresentableCount += 1
        return stubbedMakeMapViewPresentableResult
    }
}
