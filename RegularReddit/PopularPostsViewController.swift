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

class PopularPostsViewController: UIViewController {

    let apiService = APIService()
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getPopular().call { result in
            switch result {
            case .success(let posts):
                print(posts)
            case .failure(let error):
                print("error: \(error)")
            }

        }
    }


}
