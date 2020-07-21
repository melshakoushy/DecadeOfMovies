//
//  MovieDetailsVC.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/18/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MovieDetailsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var genresLbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    
    //Variables
    var selectedMovie = Movie()
    var photos = [Photo]()
    
    //Constents
    let imageCellId = "ImageCell"
    let emptyCellId = "EmptyCell"
    
    //Viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewData()
    }
    
    //Photos Collection View setup
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: imageCellId, bundle: nil), forCellWithReuseIdentifier: imageCellId)
        collectionView.register(UINib(nibName: emptyCellId, bundle: nil), forCellWithReuseIdentifier: emptyCellId)
    }
    
    //Loading the data to the view elemnts
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
    
    //Getting the photos of a movie by it's title and loading it to the photos collections
    func getPhotos() {
        self.indicator.startAnimating()
        PhotoService.instance.getPhotosByTitle(title: selectedMovie.title) { (error, photos) in
            if let photos = photos {
                self.photos = photos
                self.collectionView.reloadData()
                self.setupCollectionView()
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
            }
        }
    }
}

//CollectionView Delegate Methods
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
