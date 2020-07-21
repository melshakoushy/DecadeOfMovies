//
//  PhotoTest.swift
//  DecadeOfMoviesTests
//
//  Created by Shakoushy on 7/20/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import XCTest
@testable import DecadeOfMovies

class PhotoTest: XCTestCase {
    func testInit_ShouldTakeAttributes() {
        let photo = Photo(id: "12345", owner: "564645", secret: "5464665", server: "5464556", farm: 1, title: "avatar", ispublic: 1, isfriend: 0, isfamily: 0)
        XCTAssertEqual(photo.id,  "12345")
        XCTAssertEqual(photo.owner,  "564645")
        XCTAssertEqual(photo.secret,  "5464665")
        XCTAssertEqual(photo.server,  "5464556")
        XCTAssertEqual(photo.farm, 1) 
        XCTAssertEqual(photo.title,  "avatar")
        XCTAssertEqual(photo.ispublic, 1)
        XCTAssertEqual(photo.isfriend, 0)
        XCTAssertEqual(photo.isfamily, 0)
    }
}
