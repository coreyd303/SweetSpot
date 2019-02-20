//
//  WindowProviding.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/20/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol WindowProviding: class {
    func setRootPresentable(_ presentable: Presentable)
}

extension UIWindow: WindowProviding {
    func setRootPresentable(_ presentable: Presentable) {
        rootViewController = presentable.toPresent()
        makeKeyAndVisible()
    }
}
