//
//  UIApplication+extension.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    @discardableResult
    static func openAppSettings() -> Bool {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(settingsURL) else {
            return false
        }

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(settingsURL)
        }
        
        return true
    }
}
