//
//  MockMapView.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import MapKit
@testable import SweetSpot

class MockMapView: MKMapView {
    var invokeSetRegionCount = 0
    var invokeSetRegionParameters: (region: MKCoordinateRegion, Void)?
    override func setRegion(_ region: MKCoordinateRegion, animated: Bool) {
        invokeSetRegionCount += 1
        invokeSetRegionParameters = (region, ())
    }

    func reset() {
        invokeSetRegionCount = 0
        invokeSetRegionParameters = nil
    }
}
