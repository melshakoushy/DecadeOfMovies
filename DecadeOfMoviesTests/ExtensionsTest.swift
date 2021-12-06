//
//  ExtensionsTest.swift
//  DecadeOfMoviesTests
//
//  Created by Shakoushy on 7/20/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import UIKit
import XCTest
@testable import DecadeOfMovies

class ExtensionsTest: XCTestCase {
    
    func testRemoveDuplicates() {
        let array = [0,1,1,2,2,2,3]
        let array2 = [0,1,2,3]
        XCTAssertEqual(Array.removeDuplicates(array)(), array2)
    }
    
    func testLoadImage() {
        let image = UIImageView()
        let imgUrl = "https://farm66.static.flickr.com/65535/50132186158_862f24c4f0_m.jpg"
        XCTAssertNotNil(image.loadImage_kf(imageUrl: imgUrl))
    }
    
    func testLoadImagePerformance() {
        let image = UIImageView()
        let imgUrl = "https://farm66.static.flickr.com/65535/50132186158_862f24c4f0_m.jpg"
        XCTAssertNotNil(image.loadImage_kf(imageUrl: imgUrl))
        self.measure {
                    image.loadImage_kf(imageUrl: imgUrl)
        }
    }

}
