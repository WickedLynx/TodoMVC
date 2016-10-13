//
//  TodoMVCUITests.swift
//  TodoMVCUITests
//
//  Created by Harshad on 13/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import XCTest


class TodoMVCUITests: XCTestCase {
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldGoToListScreenAfterSuccessfulLogin() {
        
        app.textFields["Email"].typeText("harshad@leftshift.io")
        app.buttons["Next:"].tap()
        app.secureTextFields["Password"].tap()
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.string = "password"
        app.secureTextFields["Password"].pressForDuration(1.2)
        app.menuItems["Paste"].tap()
        app.keyboards.buttons["Done"].tap()
        sleep(2)
        XCTAssert(app.navigationBars["Todo List"].exists, "Did not go to the Todo List screen")
    }
    
}
