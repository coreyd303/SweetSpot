//
//  RemoteUserSession.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

struct RemoteUserSession: Codable {
    let token: AuthToken
}

extension RemoteUserSession: Equatable {
    static func ==(lhs: RemoteUserSession, rhs: RemoteUserSession) -> Bool {
        return lhs.token == rhs.token
    }
}
