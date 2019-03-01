//
//  StubMKCoordinateRegion.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

@testable import SweetSpot
import MapKit

extension MKCoordinateRegion {
    static func stub(coordinate: Coordinate = Coordinate.stub(), radius: Double = 0.0) -> MKCoordinateRegion {
        return MKCoordinateRegion(center: coordinate, latitudinalMeters: radius, longitudinalMeters: radius)
    }
}

extension Coordinate {
    static func stub(latitude: Double = 0.0, longitude: Double = 0.0) -> Coordinate {
        return Coordinate(latitude: latitude, longitude: longitude)
    }
}
