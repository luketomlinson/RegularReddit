//
//  APIError.swift
//  API
//
//  Created by Luke Tomlinson on 7/26/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case noData
    case invalidState
}
