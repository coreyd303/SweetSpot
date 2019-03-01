//
//  NetworkDispatcher.swift
//  SweetSpot
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

enum DispatchError: Error {
    case invalidURL
    case noData
}

protocol NetworkDispatcher {
    func dispatch(request: RequestData, completion: @escaping ((Result<Data>) -> Void))
}

struct URLSessionNetworkDispatcher: NetworkDispatcher {
    func dispatch(request: RequestData, completion: @escaping ((Result<Data>) -> Void)) {
        guard let url = URL(string: request.path) else {
            completion(.failure(DispatchError.invalidURL))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        // TODO: - determine and implement base headers

        do {
            if let params = request.params {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
            }
        } catch let error {
            completion(.failure(error))
        }

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(DispatchError.noData))
                return
            }

            completion(.success(data))

        }.resume()
    }


}
