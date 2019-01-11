//
//  UIApplicationTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 11/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

class UIApplicationTest: XCTestCase {
    
    let appName = "StanwoodCore"
    let buildNumber = "99"
    let shortVersion = "2.4"
    let userAgent = "ios-stanwood_core-2.4:99-release"
    let userAgentKey = "UserAgent"
    
    override func setUp() {
        super.setUp()
        UIApplication.shared.setUserAgent(env: .release)
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: userAgentKey)
    }
    
    func testAppName() {
        let appName = UIApplication.appName
        XCTAssertEqual(appName, self.appName)
    }
    
    func testBuildNumber() {
        let buildNumber = UIApplication.buildVersion
        XCTAssertEqual(buildNumber, self.buildNumber)
    }
    
    func testShortVersion() {
        let shortVersion = UIApplication.shortVersion
        XCTAssertEqual(shortVersion, self.shortVersion)
    }
    
    func testUserAgent() {
        let userAgent = UserDefaults.standard.string(forKey: userAgentKey)!
        XCTAssertEqual(userAgent, self.userAgent)
    }
}
