//
//  Post.swift
//  Model
//
//  Created by Luke Tomlinson on 7/26/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation

public struct Post: Decodable {

    let title: String
    let text: String
    let preview: Preview?

    enum CodingKeys: String, CodingKey {
        case title
        case text = "selftext"
        case preview
    }
}

struct Image: Decodable {
    let url: URL
    let width: Int
    let height: Int
}

struct ImageContainer: Decodable {
    let source: Image
    let resolutions: [Image]
}

struct Preview: Decodable {
    let images: [ImageContainer]
}
