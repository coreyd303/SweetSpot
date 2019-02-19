//
//  MapViewPresentableFactory.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
// TODO: - remove this
import UIKit

protocol MapViewPresentableFactory: class {
    func makeMapViewPresentable() -> Presentable
}

class MapViewPresentableFactoryImplementation: MapViewPresentableFactory {
    func makeMapViewPresentable() -> Presentable {
        return MapViewController.storyboardViewController()
    }
}
