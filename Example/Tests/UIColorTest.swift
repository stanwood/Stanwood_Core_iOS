//
//  UIColorTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import StanwoodCore

class UIColorTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testColor() {
        
        let color = UIColor(red: CGFloat(133.0/255.0), green: 133/255.0, blue: 133/255.0, alpha: 1.0)
        let rgbColor = UIColor(r: 133, g: 133, b: 133)
        
        XCTAssertEqual(color.description, rgbColor.description)
    }
    
    func testColorWithAlpha() {
        
        let color = UIColor(red: CGFloat(133.0/255.0), green: 133/255.0, blue: 133/255.0, alpha: 0.33)
        let rgbColor = UIColor(r: 133, g: 133, b: 133, alpha: 0.33)
        
        XCTAssertEqual(color.description, rgbColor.description)
    }
    
    func testNotColor() {
        
        let color = UIColor(red: CGFloat(133.0/255.0), green: 123/255.0, blue: 133/255.0, alpha: 1.0)
        let rgbColor = UIColor(r: 133, g: 133, b: 133)
        
        XCTAssertNotEqual(color.description, rgbColor.description)
    }
    
    func testNotColorWithAlpha() {
        
        let color = UIColor(red: CGFloat(133.0/255.0), green: 133/255.0, blue: 133/255.0, alpha: 0.24)
        let rgbColor = UIColor(r: 133, g: 133, b: 133, alpha: 0.33)
        
        XCTAssertNotEqual(color.description, rgbColor.description)
    }
}
