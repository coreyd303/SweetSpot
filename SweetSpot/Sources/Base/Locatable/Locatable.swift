//
//  Locatable.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import CoreLocation

typealias Coordinate = CLLocationCoordinate2D


protocol Locatable {
    var coordinate: Coordinate { get }
}

extension CLLocation: Locatable {}
