//
//  RequestData.swift
//  SweetSpot
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

public struct RequestData {
    let path: String
    let method: HTTPMethod
    let params: [String: Any?]?
    let headers: [String: String]?

    private var baseURL: String = {
        return "http//:someBaseUrl/"
    }()

    init(path: String, method: HTTPMethod = .get, params: [String: Any?]? = nil, headers: [String: String]? = nil) {
        self.path = baseURL + path
        self.method = method
        self.params = params
        self.headers = headers
    }
}

enum HTTPMethod: String {
    case get = "GET" // read
    case put = "PUT" // update &replace
    case patch = "PATCH" // update &modify
    case delete = "DELETE" // delete
}
