//
//  ViewController.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/18/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit
import iOSDropDown

class MoviesMainVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var yearDropDown: DropDown!
    @IBOutlet weak var tableView: UITableView!
    
    //Constants
    let movieCellId = "MovieCell"
    
    //Variabes
    var movies = DataLoader().movies
    var yearsArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDropDown()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: movieCellId, bundle: nil), forCellReuseIdentifier: movieCellId)
    }
    
    func setupDropDown() {
        for i in 0..<movies.count {
            self.yearsArray.append("\(movies[i].year)")
        }
        yearsArray.append("Clear")
        yearDropDown.optionArray = yearsArray.removeDuplicates()
        yearDropDown.didSelect{(selectedText , index ,id) in
            self.movies = DataLoader().movies.filter {$0.year == Int(selectedText)}.sorted(by: { $0.rating > $1.rating }).enumerated().compactMap{ $0.offset < 5 ? $0.element : nil }
            if selectedText == "Clear" {
                self.movies = DataLoader().movies
            }
            self.tableView.reloadData()
        }
    }
}

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
            vc.selectedMovie = movies[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)

    }
}
