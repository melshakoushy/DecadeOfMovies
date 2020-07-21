//
//  DataLoaderTest.swift
//  DecadeOfMoviesTests
//
//  Created by Shakoushy on 7/20/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import XCTest
@testable import DecadeOfMovies

class DataLoaderTest: XCTestCase {
    
    func testLoadPerformance() {
        let dataloader = DataLoader()
        self.measure {
            dataloader.load()
        }
    }
}
