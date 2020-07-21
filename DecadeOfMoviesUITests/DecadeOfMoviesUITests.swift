//
//  DecadeOfMoviesUITests.swift
//  DecadeOfMoviesUITests
//
//  Created by Mahmoud Elshakoushy on 7/18/20.
//  Copyright © 2020 Shakoushy. All rights reserved.
//

import XCTest

class DecadeOfMoviesUITests: XCTestCase {
    
    func testValidTextField() {
        let app = XCUIApplication()
        app.launch()
        
        XCTAssertEqual(app.textFields.count, 1)
        let textField = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        XCTAssertTrue(textField.exists)
        textField.tap()
        
        let tablesQuery = app.tables
        let year2010 = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["2010"]/*[[".cells.staticTexts[\"2010\"]",".staticTexts[\"2010\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(year2010.exists)
    }
    
    func testTableView() {
        let app = XCUIApplication()
        app.launch()
        
        let tablesQuery = app.tables
        XCTAssertEqual(tablesQuery.count, 1)
        
        let movie12Rouds = tablesQuery.staticTexts["12 Rounds"]
        XCTAssertTrue(movie12Rouds.exists)
        movie12Rouds.tap()
        
        let movieDetails = app.staticTexts["John Cena, Ashley Scott, Steve Harris, Aidan Gillen, Brian J. White, Taylor Cole"]
        XCTAssertNotNil(movieDetails)
    }
}
