//
//  TodoMVCUITests.swift
//  TodoMVCUITests
//
//  Created by Harshad on 13/10/16.
//  Copyright © 2016 GoJek. All rights reserved.
//

import XCTest
import SBTUITestTunnel


class TodoMVCUITests: XCTestCase {
    var app: SBTUITunneledApplication!
        
    override func setUp() {
        super.setUp()
        app = SBTUITunneledApplication()
        app.launchTunnel()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func login() {
        
        let matcher = SBTRequestMatch.URL("/login", method: "POST")
        app.stubRequestsMatching(matcher, returnJsonNamed: "login_response.json", returnCode: 200, responseTime: SBTUITunnelStubsDownloadSpeed3G)
        
        let expection = expectationWithDescription("Login call done")
        app.waitForMonitoredRequestsMatching(matcher, timeout: 10) { (matched) in
            expection.fulfill()
        }
        
        app.textFields["Email"].typeText("harshad@leftshift.io")
        app.buttons["Next:"].tap()
        app.secureTextFields["Password"].tap()
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.string = "password"
        app.secureTextFields["Password"].pressForDuration(1.2)
        app.menuItems["Paste"].tap()
        app.keyboards.buttons["Done"].tap()
        
    
    }
    
    func testShouldShowListScreenAfterSuccessfulLogin() {
        let matcher = SBTRequestMatch.URL("/todos", method: "GET")
        app.stubRequestsMatching(matcher, returnJsonNamed: "todos_response.json", returnCode: 200, responseTime: SBTUITunnelStubsDownloadSpeed3G)
        
        let expection = expectationWithDescription("Todos call done")
        app.waitForMonitoredRequestsMatching(matcher, timeout: 10) { (matched) in
            expection.fulfill()
        }
        
        login()
        
        waitForExpectationsWithTimeout(5) { (error) in
            if error != nil {
                XCTFail("Timed out: \(error!)")
            }
        }
        
        XCTAssert(app.navigationBars["Todo List"].exists, "Did not go to the Todo List screen")
        XCTAssert(app.staticTexts["Meow"].exists, "Did not show the todo list")
    }
    
}
