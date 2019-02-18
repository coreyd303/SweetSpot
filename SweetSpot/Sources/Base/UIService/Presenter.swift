//
//  Presenter.swift
//  
//
//  Created by Corey Davis on 2/18/19.
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
