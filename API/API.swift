//
//  API.swift
//  API
//
//  Created by Luke Tomlinson on 7/26/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import PinkyPromise
import Model

public class APIService {

    enum Config {
        static let baseURL = URL(string: "https://reddit.com/")!
    }

    let session: URLSession
    let decoder = JSONDecoder()

    public init(session: URLSession = .shared) {
        self.session = session
    }

    internal func get<T: APIRequest>(with request: T) -> Promise<T.ResponseType> {
        return session.dataPromise(withRequest: request.urlRequest).tryMap { data in
            return try self.decoder.decode(T.ResponseType.self, from: data)
        }
    }
}

public extension APIService {
    func getPopular() -> Promise<[Post]> {

        let url = Config.baseURL.appendingJSONPath()
        let request = PopularPostsRequest(url: url)

        return get(with: request).map { response in
            return response.data.children.map { $0.data }
        }
    }
}
