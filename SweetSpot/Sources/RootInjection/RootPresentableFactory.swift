//
//  RootPresentableFactory.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol RootPresentableFactory: class {
    func makeRootPresentable() -> RootViewController
    func makeChildPresentable(child: UIViewController) -> UINavigationController
}

public class RootPresentableFactoryImplementation: RootPresentableFactory {
    func makeRootPresentable() -> RootViewController {
        return RootViewController()
    }
    
    func makeChildPresentable(child: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: child)
    }
}
