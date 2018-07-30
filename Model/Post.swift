//
//  Post.swift
//  Model
//
//  Created by Luke Tomlinson on 7/26/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation

public protocol Loadable { } //marker protocol
public struct Post: Decodable, Loadable {

    public let title: String
    public let text: String
    public let preview: Preview

    public var imageURL: URL? {
        return preview.images.first?.source.url
    }

    enum CodingKeys: String, CodingKey {
        case title
        case text = "selftext"
        case preview
    }
}

public struct Image: Decodable {
    let url: URL
    let width: Int
    let height: Int
}

public struct ImageContainer: Decodable {
    public let source: Image
    public let resolutions: [Image]
}

public struct Preview: Decodable {
    public let images: [ImageContainer]
}
