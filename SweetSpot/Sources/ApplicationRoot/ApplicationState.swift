//
//  RootPresentable.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

enum ApplicationState {
    case launching
    case onboarding
    case signUp
    case signedIn(userSession: UserSession?)
    case signOut
}

extension ApplicationState: Equatable {
    public static func ==(lhs: ApplicationState, rhs: ApplicationState) -> Bool {
        switch(lhs, rhs) {
        case(.launching, .launching):
            return true
        case(.onboarding, .onboarding):
            return true
        case(.signUp, .signUp):
            return true
        case let (.signedIn(l), .signedIn(r)):
            return l == r
        case(.signOut, .signOut):
            return true
        case(.launching, _), (.onboarding, _), (.signedIn, _), (.signUp, _), (.signOut, _):
            return false
        }
    }
}
