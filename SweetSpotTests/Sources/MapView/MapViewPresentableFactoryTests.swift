//
//  MapViewPresentableFactoryTests.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Quick
import Nimble
@testable import SweetSpot

class MapViewPresentableFactoryTests: QuickSpec {
    override func spec() {
        var sut: MapViewPresentableFactoryImplementation!
        var result: Presentable!

        beforeEach {
            sut = MapViewPresentableFactoryImplementation()
            result = sut.makeMapViewPresentable()
        }

        it("should be a type of MapViewPresentableFactory") {
            expect(sut).to(beAKindOf(MapViewPresentableFactory.self))
        }

        it("should be an instance of MapViewPresentableFactoryImplementation") {
            expect(sut).to(beAKindOf(MapViewPresentableFactoryImplementation.self))
        }

        describe("makeMapViewPresentable") {
            it("should return a type of presentable") {
                expect(result).to(beAKindOf(Presentable.self))
            }

            it("should return an instance of MapViewController") {
                expect(result).to(beAKindOf(MapViewController.self))
            }

            context("mapViewPresentable") {
                it("should assign a provider") {
                    let viewController = result as! MapViewController
                    expect(viewController.viewModel?.locationProvider).to(beAKindOf(UserLocatableService.self))
                }

                it("should assign a viewModel") {
                    let viewController = result as! MapViewController
                    expect(viewController.viewModel).to(beAKindOf(MapViewModel.self))
                }
            }
        }
    }
}
