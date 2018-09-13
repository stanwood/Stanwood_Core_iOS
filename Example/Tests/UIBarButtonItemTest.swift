//
//  UIBarButtonItemTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 12/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class UIBarButtonItemTest: XCTestCase {

    var testButton: UIBarButtonItem!

    let localisedKey: String = "TEST_TITLE"
    let localisedTitle: String = "My test title"

    override func setUp() {
        super.setUp()

        testButton = UIBarButtonItem(localizedTitle: localisedKey, style: .done, target: nil, action: nil)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLocalisedText() {
        XCTAssertEqual(testButton.title, localisedTitle)
    }

    func testNotLocalisedKey() {
        XCTAssertNotEqual(testButton.title, localisedKey)
    }

    func testAccessibilityIdentifer() {
        XCTAssertEqual(testButton.accessibilityIdentifier, localisedKey)
    }

    func testIdentifierNotNil() {
        XCTAssertNotNil(testButton.accessibilityIdentifier)
    }
}
