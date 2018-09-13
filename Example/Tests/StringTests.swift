//
//  StringTests.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import StanwoodCore

class StringTests: XCTestCase {

    let testString: String = "This is my test string"
    let localisedKey: String = "TEST_TITLE"
    let localisedNotKey: String = "TEST_TITLE_NOT"
    let localisedTitle: String = "My test title"

    var lowercaseString = "this is my string"
    let uppercaseString = "This Is My String"

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFirstChar() {
        XCTAssertEqual(testString.first, "T")
    }

    func testLastChar() {
        XCTAssertEqual(testString.last, "g")
    }

    func testNotFirstChar() {
        XCTAssertNotEqual(testString.first, "f")
    }

    func testNotLastChar() {
        XCTAssertNotEqual(testString.last, "I")
    }

    func testLocalisedString() {
        let localisedString: String = localisedKey.localized
        XCTAssertEqual(localisedString, localisedTitle)
    }

    func testNotLocalisedString() {
        let localisedString: String = localisedNotKey.localized
        XCTAssertNotEqual(localisedString, "My test title")
    }
}
