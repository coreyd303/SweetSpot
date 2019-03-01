//
//  MapViewModelTests.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Quick
import Nimble

@testable import SweetSpot

class MapViewModelTests: QuickSpec {
    override func spec() {
        var sut: MapViewModelImplementation!
        var mockLocationService: MockUserLocatableService!
        var mockProvider: MockLocatableProvider!

        beforeEach {
            mockProvider = MockLocatableProvider()
            mockLocationService = MockUserLocatableService(provider: mockProvider)
            sut = MapViewModelImplementation(locationProvider: mockLocationService)
        }

        it("should be a type of MapViewModel") {
            expect(sut).to(beAKindOf(MapViewModel.self))
        }

        it("should be an instance of MapViewModelImplementation") {
            expect(sut).to(beAKindOf(MapViewModelImplementation.self))
        }

        describe("initialization") {
            it("should have a locationProvider") {
                expect(sut.locationProvider).to(be(mockLocationService))
            }
        }

        describe("verifyPermissions") {
            context("when permissions are granted") {

            }

            context("when permissions are not granted") {

            }
        }

        describe("requestLocationUpdates") {

        }

        describe("requestLocation") {

        }
    }
}
