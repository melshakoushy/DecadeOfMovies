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
    var selectedMovie = Movie(title: "", year: 0, cast: [String](), genres: [String](), rating: 0)

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
    }
}

extension MovieDetailsVC: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCellId, for: indexPath) as! ImageCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.collectionView.bounds.width / 2) - 10
        return CGSize(width: size, height: 220)
    }
}
