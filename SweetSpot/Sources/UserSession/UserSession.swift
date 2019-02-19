//
//  UserSession.swift
//  SweetSpot
//
//  Created by Corey Davis on 2/19/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

class UserSession: Codable {
    let profile: UserProfile
    let remoteSession: RemoteUserSession
    
    init(profile: UserProfile, remoteSession: RemoteUserSession) {
        self.profile = profile
        self.remoteSession = remoteSession
    }
}

extension UserSession: Equatable {
    static func ==(lhs: UserSession, rhs: UserSession) -> Bool {
        return (lhs.profile == rhs.profile) && (lhs.remoteSession == rhs.remoteSession)
    }
}
