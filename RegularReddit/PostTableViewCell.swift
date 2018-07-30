//
//  PostTableViewCell.swift
//  RegularReddit
//
//  Created by Luke Tomlinson on 7/27/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import UIKit
import Model

class PostTableViewCell: UITableViewCell {

    @IBOutlet var asyncImageView: AsynchronousImageView!
    
    @IBOutlet var titleLabel: UILabel!
    func configure(with post: Post) {
        self.titleLabel.text = post.title
        self.asyncImageView.url = post.imageURL
    }
    
}
