//
//  LodableTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 03/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class LodableTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadFromNib() {
        let bundle = Bundle(for: type(of: self))
        XCTAssertNotNil(LodableNib.loadFromXib(bundle: bundle), "nib should losd from bundle")
    }
    
    func testLoadFromOutlet() {
        let bundle = Bundle(for: type(of: self))
        XCTAssertNotNil(LodableNib().loadFromOutlet(bundle: bundle), "nib should losd from bundle")
    }
}
