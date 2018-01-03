//
//  UILabelTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest

class UILabelTest: XCTestCase {
    
    var testLabel: UILabel!
    
    let localisedKey: String = "TEST_TITLE"
    let localisedTitle: String = "My test title"
    
    override func setUp() {
        super.setUp()
        
        testLabel = UILabel()
        testLabel.localizedText = localisedKey
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testLocalisedText() {
        XCTAssertEqual(testLabel.text, localisedTitle)
    }
    
    func testNotLocalisedKey() {
        XCTAssertNotEqual(testLabel.text, localisedKey)
    }
    
    func testAccessibilityIdentifer() {
        XCTAssertEqual(testLabel.accessibilityIdentifier, localisedKey)
    }
    
    func testIdentifierNotNil() {
        XCTAssertNotNil(testLabel.accessibilityIdentifier)
    }
}
