//
//  String.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

extension String {
    // MARK: - User alerts
    static let locationServicesNotEnabledAlertTitle = NSLocalizedString("Location services have not been enabled", comment: "")
    static let locationServicesNotEnabledAlertMsg = NSLocalizedString("please enable them in settings to continue", comment: "")
    static let locationCouldNotBeFoundAlertTitle = NSLocalizedString("We could not find your location", comment: "")
    static let locationCouldNotBeFoundAlertMsg = NSLocalizedString("Please ensure location services are enabled and try again", comment: "")
    static let okay = NSLocalizedString("OK", comment: "")
    static let goToSettings = NSLocalizedString("Go to settings", comment: "")

    // MARK: - MapView
    static let filterLocations = NSLocalizedString("Filter Locations", comment: "")
}
