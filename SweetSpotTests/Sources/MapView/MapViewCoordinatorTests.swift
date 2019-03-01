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
        var sut: MapViewCoordinatorImplementation!
        var mockRouter: MockRouter!
        var mockPresentableFactory: MockMapViewPresentableFactory!
        var stubPresentable: Presentable!

        beforeEach {
            mockRouter = MockRouter()
            mockPresentableFactory = MockMapViewPresentableFactory()
            stubPresentable = MockPresentable.stub(presentable: MapViewController())
            mockPresentableFactory.stubbedMakeMapViewPresentableResult = stubPresentable
            sut = MapViewCoordinatorImplementation(router: mockRouter, presentableFactory: mockPresentableFactory)
        }

        it("should be a type of MapViewCoordinator") {
            expect(sut).to(beAKindOf(MapViewCoordinator.self))
        }

        it("should be an instance of MapViewCoordinator") {
            expect(sut).to(beAKindOf(MapViewCoordinatorImplementation.self))
        }

        describe("on Start") {
            beforeEach {
                sut.start()
            }

            it("should invoke makeMapViewPresentable on presentableFactory") {
                expect(mockPresentableFactory.invokedMakeMapViewPresentableCount).to(equal(1))
            }

            it("should invoke setRootPresentable on router") {
                expect(mockRouter.invokedSetRootPresentableCount).to(equal(1))
            }

            it("should invoke setRootPresentable with matching presentable") {
                expect(mockRouter.invokedSetRootPresentableParameters?.presentable).to(be(stubPresentable))
            }
        }
    }
}
