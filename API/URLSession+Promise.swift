//
//  URLSession+Promise.swift
//  API
//
//  Created by Luke Tomlinson on 7/26/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import PinkyPromise

extension URLSession {

    func dataPromise(withRequest request: URLRequest) -> Promise<Data> {
        return Promise { [weak self] fulfill in

            guard let strongSelf = self else {
                fulfill(.failure(APIError.invalidState))
                return
            }

            strongSelf.dataTask(with: request) { data, response, error in

                if let error = error {
                    fulfill(.failure(error))
                    return
                }

                guard let data = data, response != nil else {
                    fulfill(.failure(APIError.noData))
                    return
                }

                fulfill(.success(data))

                }.resume()
        }
    }
}
