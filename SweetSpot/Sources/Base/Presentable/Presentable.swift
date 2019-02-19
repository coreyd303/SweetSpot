//
//  Presentable.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/18/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol Presentable: Presenter {
    func toPresent() -> UIViewController
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}
