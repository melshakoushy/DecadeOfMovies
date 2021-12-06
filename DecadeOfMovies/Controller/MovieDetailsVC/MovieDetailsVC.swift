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
    
    // MARK: Outlets
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var genresLbl: UILabel!
    @IBOutlet weak var castLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var indicator: NVActivityIndicatorView!
    
    // MARK: Properties
    var selectedMovie = Movie()
    var photos = [Photo]()
    
    // MARK: Constants
    let imageCellId = "ImageCell"
    let emptyCellId = "EmptyCell"
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadViewData()
    }
    
    //MARK: Setup
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
