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

        continueAfterFailure = false

 
    }

    override func tearDown() {
        
    }
    
    
//    func testWhen_API_Error_Should_Show_Error_Message() {
//
//        self.app.launchEnvironment = ["contactsListAPI(request:)":FakeData.api_contactsListAPI_error() , "queryContacts()":FakeData.db_queryContacts_success()]
//        self.app.launch()
//        let progress = app.otherElements["api error (999)"]
//        let exists = NSPredicate(format: "exists == 1")
//        expectation(for: exists, evaluatedWith: progress, handler: nil)
//        waitForExpectations(timeout: 5, handler: nil)
//
//    }
//
//
//    func testWhen_User_Click_Cell_Then_Go_ContactsViewController_Assert_Info() {
//
//        self.app.launchEnvironment = ["contactsListAPI(request:)":FakeData.api_contactsListAPI_success() , "queryContacts()":FakeData.db_queryContacts_success()]
//        self.app.launch()
//        let cells = self.app.tables.cells
//        let exists = NSPredicate(format: "count == 5")
//        expectation(for: exists, evaluatedWith: cells, handler: nil)
//        waitForExpectations(timeout: 5, handler: nil)
//        let cell0 = cells.element(boundBy: 0)
//        XCTAssertTrue(cell0.images["icon1"].exists)
//        XCTAssertTrue(cell0.staticTexts["A - UI測試複製人"].exists)
//        print("\(self.app.debugDescription)")
//
//
//
//        cell0.tap()
//        XCTAssertTrue(self.app.navigationBars["聯絡人詳細資料"].exists)
//        XCTAssertTrue(self.app.staticTexts["A - UI測試複製人"].exists)
//        XCTAssertTrue(self.app.staticTexts["11"].exists)
//        XCTAssertTrue(self.app.staticTexts["0911111112"].exists)
//        XCTAssertTrue(self.app.images["icon1"].exists)
//
//    }

}
