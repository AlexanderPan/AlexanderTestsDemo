//
//  AlexanderTestsDemoUITests.swift
//  AlexanderTestsDemoUITests
//
//  Created by 潘皓群 on 2019/3/23.
//  Copyright © 2019 潘皓群. All rights reserved.
//

import XCTest

class AlexanderTestsDemoUITests: XCTestCase {

    var app:XCUIApplication = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
      
        self.app.launchEnvironment = ["contactsListAPI(request:)":FakeData.api_contactsListAPI_success() , "queryContacts()":FakeData.db_queryContacts_success()]
        
        self.app.launch()
        
        let cells = self.app.tables.cells
        let exists = NSPredicate(format: "count == 5")
        
        expectation(for: exists, evaluatedWith: cells, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        
        cells.element(boundBy: 0).tap()
        
        XCTAssertTrue(self.app.navigationBars["聯絡人詳細資料"].exists)
        XCTAssertTrue(self.app.staticTexts["A - UI測試複製人"].exists)
        XCTAssertTrue(self.app.staticTexts["11"].exists)
        XCTAssertTrue(self.app.staticTexts["0911111112"].exists)
        XCTAssertTrue(self.app.images["icon1"].exists)
        
    }

}
