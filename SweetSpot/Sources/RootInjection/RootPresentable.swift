//
//  RootPresentable.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

enum RootPresentable {
    case launching
    case onboarding
    case signedIn(userSession: UserSession)
}

extension RootPresentable: Equatable {
    public static func ==(lhs: RootPresentable, rhs: RootPresentable) -> Bool {
        switch(lhs, rhs) {
        case(.launching, .launching):
            return true
        case(.onboarding, .onboarding):
            return true
        case let (.signedIn(l), .signedIn(r)):
            return l == r
        case(.launching, _), (.onboarding, _), (.signedIn, _):
            return false
        }
    }
}
