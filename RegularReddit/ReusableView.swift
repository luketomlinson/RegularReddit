//
//  ReusableView.swift
//  RegularReddit
//
//  Created by Luke Tomlinson on 7/30/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import UIKit

protocol ReuseableView {
    static var reuseIdentifier: String { get }
}

extension UITableViewCell: ReuseableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableView {

    func register<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: type.reuseIdentifier)
    }

    func dequeue<T: UITableViewCell>(_ type: T.Type, at indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
