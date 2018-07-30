//
//  PopularPostsViewController.swift
//  RegularReddit
//
//  Created by Luke Tomlinson on 7/27/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import UIKit
import API
import Model

class PopularPostsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    let apiService = APIService()
    var posts: LoadingState<[Post]> = .notRequested

    lazy var tableController: PopularTableController = {
        return PopularTableController(tableView: self.tableView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        posts = .loading
        apiService.getPopular().call { result in
            switch result {
            case .success(let posts):
                self.posts = .loaded(posts)
            case .failure(let error):
                self.posts = .error(error)
            }

            self.tableController.update(with: self.posts)

        }
    }


}
