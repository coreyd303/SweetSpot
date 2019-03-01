//
//  StubPresentable.swift
//  SweetSpotTests
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import UIKit
@testable import SweetSpot

extension MockPresentable {
    static func stub(presentable: Presentable = UIViewController()) -> Presentable {
        return presentable
    }
}
