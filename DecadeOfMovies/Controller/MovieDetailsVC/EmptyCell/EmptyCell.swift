//
//  EmptyCell.swift
//  DecadeOfMovies
//
//  Created by Shakoushy on 7/20/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class EmptyCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    // MARK: LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
