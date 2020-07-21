//
//  ImageCell.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/19/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    //Outlets
    @IBOutlet weak var movieImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    //setting up the view elements
    func setupView() {
        movieImg.addcornerRadius(radius: 10)
    }
}
