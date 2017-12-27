//
//  UIButtonTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest

class UIButtonTest: XCTestCase {
    
    var testButton: UIButton!
    
    let localisedKey: String = "TEST_TITLE"
    let localisedTitle: String = "My test title"
    
    override func setUp() {
        super.setUp()
        
        
        testButton = UIButton()
        testButton.localisedTitle = localisedKey
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalisedText() {
        XCTAssertEqual(testButton.titleLabel?.text, localisedTitle)
    }
    
    func testNotLocalisedKey() {
        XCTAssertNotEqual(testButton.titleLabel?.text, localisedKey)
    }
    
    func testAccessibilityIdentifer() {
        XCTAssertEqual(testButton.accessibilityIdentifier, localisedKey)
    }
    
    func testIdentifierNotNil() {
        XCTAssertNotNil(testButton.accessibilityIdentifier)
    }
}
