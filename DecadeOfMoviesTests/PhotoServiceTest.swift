//
//  PhotoServiceTest.swift
//  DecadeOfMoviesTests
//
//  Created by Shakoushy on 7/20/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import XCTest
@testable import DecadeOfMovies

class PhotoServiceTest: XCTestCase {

    func testgetPhotosByTitle() {
        let photoServie = PhotoService()
        let title = "2012"
        let ex = expectation(description: "Expecting a JSON data not nil")
        photoServie.getPhotosByTitle(title: title) { (error, result) in
            XCTAssertNil(error)
            XCTAssertNotNil(result)
            ex.fulfill()
        }
        waitForExpectations(timeout: 10) { (error) in
          if let error = error {
            XCTFail("error: \(error)")
          }
        }
    }

    func testgetPhotosByTitlePerformance()  {
        let photoServie = PhotoService()
        let title = "2012"
        self.measure {
            photoServie.getPhotosByTitle(title: title) { (error, result) in
            }
        }
    }
}
