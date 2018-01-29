//
//  UITextField.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 29/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class UITextFieldTest: XCTestCase {
    
    var testTextField: UITextField!
    
    let localisedKey: String = "TEST_TITLE"
    let localisedTitle: String = "My test title"
    
    override func setUp() {
        super.setUp()
        
        testTextField = UITextField()
        testTextField.localizedPlaceholder = localisedKey
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalisedText() {
        XCTAssertEqual(testTextField.placeholder, localisedTitle)
    }
    
    func testNotLocalisedKey() {
        XCTAssertNotEqual(testTextField.text, localisedKey)
    }
    
    func testAccessibilityIdentifer() {
        XCTAssertEqual(testTextField.accessibilityIdentifier, localisedKey)
    }
    
    func testIdentifierNotNil() {
        XCTAssertNotNil(testTextField.accessibilityIdentifier)
    }
}
