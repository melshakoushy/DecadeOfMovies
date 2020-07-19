//
//  UIImageViewExt.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/19/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImage_kf(imageUrl: String,  placeholderImage: String = "NoImageName") {
        let imgUrl = URL(string: imageUrl)
        let placeHolder = UIImage(named: placeholderImage)
        self.kf.setImage(
            with: imgUrl,
            placeholder: placeHolder,
            options: [.transition(.fade(1)), .cacheOriginalImage])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
                DispatchQueue.main.async {
                    self.image = value.image
                }
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}

