//
//  Loading.swift
//  RegularReddit
//
//  Created by Luke Tomlinson on 7/27/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import Model

enum LoadingState<T> {
    case notRequested
    case loading
    case loaded(T)
    case error(Error)

    var value: T? {
        guard case .loaded(let value) = self else {
            return nil
        }
        return value
    }

    func value(default: T) -> T {
        return value ?? `default`
    }
}
