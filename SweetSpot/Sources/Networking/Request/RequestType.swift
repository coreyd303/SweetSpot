//
//  RequestType.swift
//  SweetSpot
//
//  Created by Corey Davis on 3/1/19.
//  Copyright © 2019 SweetSpot. All rights reserved.
//

import Foundation

protocol RequestType {
    associatedtype ResponseType: Codable
    var data: RequestData { get }
}

extension RequestType {
    func execute (dispatcher: NetworkDispatcher = URLSessionNetworkDispatcher(), completion: @escaping ((Result<ResponseType>) -> Void)) {
        dispatcher.dispatch(request: self.data, completion: { (responseData: Result<Data>) in
            switch responseData {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(ResponseType.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(result))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        })
    }
}



