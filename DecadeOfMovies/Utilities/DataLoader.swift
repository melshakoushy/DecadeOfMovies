//
//  DataLoader.swift
//  DecadeOfMovies
//
//  Created by Mahmoud Elshakoushy on 7/19/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import Foundation

public class DataLoader {
    
    var movies = [Movie]()
    
    init() {
        load()
    }
    
    func load() {
        
        if let fileLocation = Bundle.main.url(forResource: "movies", withExtension: "json") {
            
            // do catch in case of an error
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                let moviesArray = jsonResult?.value(forKey: "movies") as! NSArray
                for arrayData in moviesArray {
                    let movie = arrayData as! [String: Any]
                    let title = movie["title"] as! String
                    let year = movie["year"] as! Int
                    let rating = movie["rating"] as! Int
                    var cas = [String]()
                    if let cast = movie["cast"] as? Array<String> {
                        for item in cast {
                            cas.append(item)
                        }
                    }
                    var gen = [String]()
                    if let cast = movie["genres"] as? Array<String> {
                        for item in cast {
                            gen.append(item)
                        }
                    }
                    let mov = Movie(title: title, year: year, cast: cas, genres: gen, rating: rating)
                    self.movies.append(mov)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
