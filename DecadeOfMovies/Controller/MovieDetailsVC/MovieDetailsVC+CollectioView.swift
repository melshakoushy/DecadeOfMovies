//
//  MovieDetailsVC+CollectioView.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/21/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

extension MovieDetailsVC: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photos.count == 0 {
            return 1
        } else {
            return photos.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if photos.count == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: emptyCellId, for: indexPath) as! EmptyCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: indexPath) as! ImageCell
            //Creating the Image url
            let urlString = "https://farm\(photos[indexPath.row].farm).static.flickr.com/\(photos[indexPath.row].server)/\(photos[indexPath.row].id)_\(photos[indexPath.row].secret)_m.jpg"
            cell.movieImg.loadImage_kf(imageUrl: urlString)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if photos.count == 0 {
            let width = self.collectionView.bounds.width
            let hight = self.collectionView.bounds.height
            return CGSize(width: width, height: hight)
        } else {
            let size = (self.collectionView.bounds.width / 2) - 10
            return CGSize(width: size, height: 220)
        }
    }
}
