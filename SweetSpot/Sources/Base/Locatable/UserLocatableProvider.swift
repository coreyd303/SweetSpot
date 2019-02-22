//
//  UserLocationProvider.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

enum UserLocatableError: Error {
    case cannotFindLocation
    case notAllowed
}

// TODO: - this can use the Result structure that phil uses
typealias UserLocatableCompletionBlock = (Result<Locatable>) -> Void

protocol UserLocatableProvider {
    func findUserLocation(then: @escaping UserLocatableCompletionBlock)
    func startUpdatingLocation()
    func stopUpdatingLocation()
}
