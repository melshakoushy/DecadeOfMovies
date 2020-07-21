//
//  ImageCell.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/19/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var movieImg: UIImageView!
    
    // MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //MARK: Setup
    func setupView() {
        movieImg.addcornerRadius(radius: 10)
    }
}
