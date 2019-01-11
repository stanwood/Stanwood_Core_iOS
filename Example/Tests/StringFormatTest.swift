//
//  StringFormatTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 12/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class StringFormatTest: XCTestCase {
    
    var testLabel: UILabel!
    
    let localisedKey: String = "TEST_FORMAT_TITLE"
    var localisedTitle: String!
    let argString: String = "localized"
    let snakeCaseString: String = "this_is_my_snake_case_string"
    let camelCaseString: String = "This Is My Snake Case String"
    
    override func setUp() {
        super.setUp()
        
        localisedTitle = "Test format title \(argString)"
        
        /// UILabel
        testLabel = UILabel()
        testLabel.localizeText(formatKey: localisedKey, argString, argString)
    }
    
    func testLocalisedText() {
        XCTAssertEqual(testLabel.text, localisedTitle!)
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
    
    func testSnakeCaseString() {
        XCTAssertEqual(snakeCaseString, camelCaseString.snakeCased()!)
    }
}
