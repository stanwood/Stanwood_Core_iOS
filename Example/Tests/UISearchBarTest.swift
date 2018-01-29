//
//  UISearchBar.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 29/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class UISearchBarTest: XCTestCase {
    
    var testSearchBar: UISearchBar!
    
    let localisedKey: String = "TEST_TITLE"
    let localisedTitle: String = "My test title"
    
    override func setUp() {
        super.setUp()
        
        testSearchBar = UISearchBar()
        testSearchBar.localizedPlaceholder = localisedKey
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalisedText() {
        XCTAssertEqual(testSearchBar.placeholder, localisedTitle)
    }
    
    func testNotLocalisedKey() {
        XCTAssertNotEqual(testSearchBar.text, localisedKey)
    }
    
    func testAccessibilityIdentifer() {
        XCTAssertEqual(testSearchBar.accessibilityIdentifier, localisedKey)
    }
    
    func testIdentifierNotNil() {
        XCTAssertNotNil(testSearchBar.accessibilityIdentifier)
    }
}
