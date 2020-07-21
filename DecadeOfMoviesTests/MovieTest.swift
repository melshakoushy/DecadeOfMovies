//
//  MovieTest.swift
//  DecadeOfMoviesTests
//
//  Created by Shakoushy on 7/20/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import XCTest
@testable import DecadeOfMovies

class MovieTest: XCTestCase {

    func testInit_ShouldTakeAttributes() {
        let movie = Movie(title: "Avatar", year: 2009, cast: ["Zoe Saldana", "Neytiri"], genres: ["Adventures"], rating: 8)
        XCTAssertEqual(movie.title,  "Avatar")
        XCTAssertEqual(movie.year,  2009)
        XCTAssertEqual(movie.cast,  ["Zoe Saldana", "Neytiri"])
        XCTAssertEqual(movie.genres,  ["Adventures"])
        XCTAssertEqual(movie.rating,  8)
    }
}

