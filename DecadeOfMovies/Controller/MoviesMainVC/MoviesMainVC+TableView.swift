//
//  MoviesMainVC+TableView.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/21/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit

extension MoviesMainVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: movieCellId , for: indexPath) as! MovieCell
        cell.nameLbl.text = movies[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailsVC") as! MovieDetailsVC
        //Passing the selected movie to the next view controller
        vc.selectedMovie = movies[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
