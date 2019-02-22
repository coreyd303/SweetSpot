//
//  AlertManager.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

struct UserAlert {
    let title: String
    let msg: String
    let actions: [UIAlertAction]?
    let style: UIAlertController.Style
    let completion: (() -> Void)?
}

protocol AlertManager: class {
    func display(alert: UserAlert)
}

extension UIViewController: AlertManager {
    func display(alert: UserAlert) {
        let alertController = UIAlertController(title: alert.title, message: alert.msg, preferredStyle: alert.style)
        
        if let actions = alert.actions {
            actions.forEach({ alertController.addAction($0) })
        } else {
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
        }
        self.present(alertController, animated: true, completion: alert.completion)
    }
}
