//
//  Presenter.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

protocol Presenter: class {
    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?)
    func dismissPresentable(animated: Bool, completion: (() -> Void)?)
}

extension UIViewController: Presenter {
    func present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?) {
        present(presentable.toPresent(), animated: animated, completion: completion)
    }
    
    func dismissPresentable(animated: Bool, completion: (() -> Void)?) {
        dismiss(animated: animated, completion: completion)
    }
}
