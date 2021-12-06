//
//  Movie.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/19/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation

struct Movie {
    
    // MARK: Properties
    var title = ""
    var year = 0
    var cast = [String]()
    var genres =  [String]()
    var rating = 0
    
    //MARK: initialization
    init(title: String, year: Int, cast: [String], genres: [String], rating: Int) {
        self.title = title
        self.year = year
        self.cast = cast
        self.genres = genres
        self.rating = rating
    }
    
    init() {
        
    }
}
