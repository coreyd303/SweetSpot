//
//  MapViewCoordinatorTests.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SweetSpot

class MapViewCoordinatorTests: QuickSpec {
    override func spec() {
        var sut: MapViewCoordinator!
        var mockRouter: MockRouter!
        var mockPresentableFactory: MockMapViewPresentableFactory!

        beforeEach {
            sut = MapViewCoordinator()
        }

        it("should be an instance of MapViewCoordinator") {
            expect(sut).to(beAKindOf(MapViewCoordinator.self))
        }

        describe("on Start") {

        }
    }
}
