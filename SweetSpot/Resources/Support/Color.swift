//
//  Color.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/21/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation
import UIKit

struct Color {
    struct Flat {
        struct Green {
            static let marianas = UIColor(netHex: 0x3B5656)
        }
        
        struct Grey {
            static let lightWash = UIColor(netHex: 0xF6F4F6)
            static let mediumWash = UIColor(netHex: 0xE2E0E2)
            static let darkWash = UIColor(netHex: 0xABA8A8)
            static let gunMetal = UIColor(netHex: 0x2D2829)
        }

        struct Base {
            static let black = UIColor.black
            static let white = UIColor.white
        }
    }
}
