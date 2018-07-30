//
//  AsynchronousImageView.swift
//  RegularReddit
//
//  Created by Luke Tomlinson on 7/27/18.
//  Copyright © 2018 Luke Tomlinson. All rights reserved.
//

import Foundation
import UIKit
import PinkyPromise
import API

class AsynchronousImageView: UIImageView {

    enum ImageError: Error {
        case noURL
    }
    var url: URL? {
        didSet {
            fetchImage()
        }
    }
    var placeholder: UIImage?

    func fetchImage() {
        guard let url = url else {
            image = placeholder
            return
        }

        let request = URLRequest(url: url)
        URLSession.shared.imagePromise(withRequest: request).inBackground().call { [weak self] result in
            switch result {
            case .success(let image):
                self?.image = image
            case .failure:
                self?.image = self?.placeholder
            }
        }

    }
}
