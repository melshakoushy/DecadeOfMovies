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

    // MARK: Outlets
    @IBOutlet weak var yearDropDown: DropDown!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Constants
    let movieCellId = "MovieCell"
    
    // MARK: Properties
    var movies = DataLoader().movies
    var yearsArray = [String]()
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupDropDown()
    }
    
    //MARK: Setup
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: movieCellId, bundle: nil), forCellReuseIdentifier: movieCellId)
    }
    
    //MARK: Setup
    func setupDropDown() {
        for i in 0..<movies.count {
            //Adding the years to the array
            self.yearsArray.append("\(movies[i].year)")
        }
        //Adding Clear Option
        yearsArray.append("Clear")
        //Removing Duplicates from the array
        yearDropDown.optionArray = yearsArray.removeDuplicates()
        yearDropDown.didSelect{(selectedText , index ,id) in
            //Filtering, sorting and getting the top rated five movies
            self.movies = DataLoader().movies.filter {$0.year == Int(selectedText)}.sorted(by: { $0.rating > $1.rating }).enumerated().compactMap{ $0.offset < 5 ? $0.element : nil }
            if selectedText == "Clear" {
                self.movies = DataLoader().movies
            }
            self.tableView.reloadData()
        }
    }
}

