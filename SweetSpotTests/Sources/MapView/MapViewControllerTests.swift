//
//  MapViewControllerTests.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Quick
import Nimble

@testable import SweetSpot
import MapKit

class MapViewControllerTests: QuickSpec {
    override func spec() {
        var sut: MapViewController!
        var mockViewModel: MockMapViewModel!
        var mockLocationService: MockUserLocatableService!
        var mockLocation: MockLocatable!
        var mockMapView: MockMapView!
        var stubCoordinate: Coordinate!

        beforeEach {
            sut = MapViewController.storyboardViewController()
            mockViewModel = MockMapViewModel()
            mockLocationService = MockUserLocatableService(provider: MockLocatableProvider())
            mockViewModel.stubbedLocationProvider = mockLocationService
            mockLocation = MockLocatable()
            stubCoordinate = Coordinate.stub(latitude: 999, longitude: 666)
            mockLocation.stubbedCoordinate = stubCoordinate
            mockViewModel.stubbedRequestLocationCompletionResult = (.success(mockLocation), ())
            mockViewModel.stubbedVerifyPermissionsCompletionResult = (.success(true), ())
            mockViewModel.stubbedRegionRadius = 100
            mockLocation.stubbedCoordinate = stubCoordinate
            mockMapView = MockMapView()
            sut.viewModel = mockViewModel
            sut.mapView = mockMapView
            
        }

        describe("viewDidLoad") {
            beforeEach {
                (sut.mapView as? MockMapView)?.reset()
                sut.viewDidLoad()
            }

            context("when setupLocation is called") {
                it("should invoke requestLocation on viewModel") {
                    expect(mockViewModel.invokedRequestLocationCount).to(equal(1))
                }

                context("when request location is successful") {
                    it("should center the map") {
                        let mapView = sut.mapView as? MockMapView
                        expect(mapView?.invokeSetRegionCount).to(equal(1))
                    }

                    fit("should provide a region to center the map on") {
                        let mapView = sut.mapView as? MockMapView
                        expect(mapView?.invokeSetRegionParameters?.region.center.latitude).to(equal(stubCoordinate.latitude))
                    }
                }

                context("when request location fails") {
                    beforeEach {
                        mockViewModel.stubbedRequestLocationCompletionResult = (.failure(NSError()), ())
                        sut.viewModel = mockViewModel
                        sut.viewDidLoad()
                    }

                    it("display an alert to user") {
                        expect(sut.presentedViewController).to(beAKindOf(UIAlertController.self))
                    }
                }
            }
        }
    }
}
