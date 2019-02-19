//
//  RootViewController.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UIViewController {
    func present(_ presentable: RootPresentable) {
        switch presentable {
        case .launching:
            return
        case .onboarding:
            return
        case .signedIn(let userSession):
            return
        }
    }
}
