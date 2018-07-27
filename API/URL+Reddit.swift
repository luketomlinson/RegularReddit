//
//  URL+Reddit.swift
//  API
//
//  Created by Luke Tomlinson on 7/27/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation

extension URL {

    func appendingJSONPath() -> URL {
        return self.appendingPathComponent(".json")
    }
}
