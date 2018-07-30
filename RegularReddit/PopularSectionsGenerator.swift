//
//  PopularSectionsGenerator.swift
//  RegularReddit
//
//  Created by Luke Tomlinson on 7/27/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import Model
struct PopularSectionsGenerator {

    enum Section {
        case posts([Post])
    }

    let sections: [Section]

    init(loading: LoadingState<[Post]>) {
        let posts = loading.value(default: [])
        self.sections = [Section.posts(posts)]
    }
}
