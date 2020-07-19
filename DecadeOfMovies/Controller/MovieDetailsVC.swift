//
//  MovieDetailsVC.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/18/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var genresLbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //Variables
    var selectedMovie = Movie()
    var photos = [Photo]()
    
    //Constents
    let imageCellId = "ImageCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewData()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: imageCellId, bundle: nil), forCellWithReuseIdentifier: imageCellId)
    }
    
    func loadViewData() {
        self.title = selectedMovie.title
        self.titleLbl.text = selectedMovie.title
        self.yearLbl.text = "\(selectedMovie.year)"
        if selectedMovie.genres.count > 0 {
            self.genresLbl.text = selectedMovie.genres.joined(separator: ", ")
        } else {
            self.genresLbl.text = "This Movie doesn't have a specific genre"
        }
        if selectedMovie.cast.count > 0 {
            self.castLbl.text = selectedMovie.cast.joined(separator: ", ")
        } else {
            self.castLbl.text = "This Movie doesn't have any known cast"
        }
        getPhotos()
    }
    
    func getPhotos() {
        PhotoService.instance.getPhotosByTitle(title: "2012") { (error, photos) in
            if let photos = photos {
                self.photos = photos
                self.collectionView.reloadData()
            }
        }
    }
}

extension MovieDetailsVC: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: indexPath) as! ImageCell
        let urlString = "https://farm​\(photos[indexPath.row].farm).static.flickr.com/​\(photos[indexPath.row].server)/​\(photos[indexPath.row].id)_​\(photos[indexPath.row].secret)_m.jpg"
        cell.movieImg.loadImage_kf(imageUrl: urlString)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.collectionView.bounds.width / 2) - 10
        return CGSize(width: size, height: 220)
    }
}
