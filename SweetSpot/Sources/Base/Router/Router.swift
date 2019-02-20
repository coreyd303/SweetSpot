//
//  Router.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/20/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol Router: Presentable {
    var rootController: UINavigationController { get set }
    func push(_ presentable: Presentable)
    func pop()
    func setRootPresentable(_ presentable: Presentable)
}

class RouterImplementation: Router {
    var rootController: UINavigationController
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func push(_ presentable: Presentable) {
        rootController.pushViewController(presentable.toPresent(), animated: true)
    }
    
    func pop() {
        rootController.popViewController(animated: true)
    }
    
    func setRootPresentable(_ presentable: Presentable) {
        rootController.viewControllers = [presentable.toPresent()]
    }
    
    func toPresent() -> UIViewController {
        return rootController
    }
    
    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?) {
        rootController.present(presentable.toPresent(), animated: animated, completion: completion)
    }
    
    func dismissPresentable(animated: Bool, completion: (() -> Void)?) {
        rootController.dismiss(animated: animated, completion: completion)
    }
}
