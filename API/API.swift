//
//  API.swift
//  API
//
//  Created by Luke Tomlinson on 7/26/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import PinkyPromise

class APIService {


    let session: URLSession
    let decoder = JSONDecoder()

    init(session: URLSession = .shared) {
        self.session = session
    }

    internal func get<T: APIRequest>(with request: T) -> Promise<T.ResponseType> {
        return session.dataPromise(withRequest: request.urlRequest).tryMap { data in
            return try self.decoder.decode(T.ResponseType.self, from: data)
        }
    }

}

