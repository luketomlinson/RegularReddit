//
//  PopularTableController.swift
//  RegularReddit
//
//  Created by Luke Tomlinson on 7/27/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import UIKit
import Model

class PopularTableController: NSObject, UITableViewDataSource {

    var sections: [PopularSectionsGenerator.Section] = []

    var cellTypes: [UITableViewCell.Type] = [PostTableViewCell.self]
    weak var tableView: UITableView?

    func update(with loadingState: LoadingState<[Post]>) {
        let sectionGenerator = PopularSectionsGenerator(loading: loadingState)
        self.sections = sectionGenerator.sections
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.reloadData()
        }
    }

    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        tableView.dataSource = self
        cellTypes.forEach(tableView.register)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .posts(let posts):
            return posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let post = getPost(for: indexPath)
        let cell = tableView.dequeue(PostTableViewCell.self, at: indexPath)
        cell.configure(with: post)
        return cell
    }

    func getPost(for indexPath: IndexPath) -> Post {
        switch sections[indexPath.section] {
        case .posts(let posts):
            return posts[indexPath.row]
        }
    }
}
