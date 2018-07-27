//
//  APIResponse.swift
//  API
//
//  Created by Luke Tomlinson on 7/26/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import Model

protocol APIResponse: Decodable {
    
}

struct RedditResponse: APIResponse {
    let kind: String?
    let data: ResponseData
}

struct ResponseData: Decodable {
    let children: [PostData]
}

struct PostData: Decodable {
    let data: Post
}
