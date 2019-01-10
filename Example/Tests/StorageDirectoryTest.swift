//
//  StorageDirectoryTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 10/01/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import StanwoodCore

class StorageDirectoryTest: XCTestCase {
    
    var member: Member!
    var otherMember: Member!
    
    let memberFileName: String = "member_directory"
    let otherMemberFileName: String = "otherMember_directory"
    let membersFileName: String = "members_directory"
    let directory: String = "CoreTest"
    
    override func setUp() {
        super.setUp()
        
        member = Member(name: "Bobby Storage", id: 123, hobby: .snowboarding)
        otherMember = Member(name: "Fred McLovin", id: 321, hobby: .snowboarding)
        
        try? Stanwood.Storage.store(member, to: .documents(customDirectory: directory), as: .json, withName: memberFileName)
        try? Stanwood.Storage.store(member, to: .caches(customDirectory: directory), as: .json, withName: memberFileName)
        try? Stanwood.Storage.store(member, to: .library(customDirectory: directory), as: .json, withName: memberFileName)
        try? Stanwood.Storage.store(otherMember, to: .documents(customDirectory: directory), as: .json, withName: otherMemberFileName)
    }
    
    override func tearDown() {
        super.tearDown()
        
        try? Stanwood.Storage.remove(memberFileName, of: .json, from: .caches(customDirectory: directory))
        try? Stanwood.Storage.remove(memberFileName, of: .json, from: .library(customDirectory: directory))
        try? Stanwood.Storage.remove(memberFileName, of: .json, from: .documents(customDirectory: directory))
    }
    
    func testStoredMembers() {
        
        XCTAssertTrue(try! Stanwood.Storage.fileExists(memberFileName, of: .json, in: .documents(customDirectory: directory)), "checking of member object is saved to documents")
        XCTAssertTrue(try! Stanwood.Storage.fileExists(memberFileName, of: .json, in: .caches(customDirectory: directory)), "checking of member object is saved to caches")
        XCTAssertTrue(try! Stanwood.Storage.fileExists(memberFileName, of: .json, in: .library(customDirectory: directory)), "checking of member object is saved to library")
    }
    
    func testMember() {
        let storedMember = try? Stanwood.Storage.retrieve(memberFileName, of: .json, from: .documents(customDirectory: directory), as: Member.self)
        let cachedMember = try? Stanwood.Storage.retrieve(memberFileName, of: .json, from: .caches(customDirectory: directory), as: Member.self)
        let libraryMember = try? Stanwood.Storage.retrieve(memberFileName, of: .json, from: .library(customDirectory: directory), as: Member.self)
        
        let member = Member(name: "Bobby Storage", id: 123, hobby: .snowboarding)
        
        XCTAssertEqual(storedMember, member)
        XCTAssertEqual(cachedMember, member)
        XCTAssertEqual(libraryMember, member)
    }
    
    func testNotMember() {
        let storedMember = try? Stanwood.Storage.retrieve(otherMemberFileName, of: .json, from: .documents(customDirectory: directory), as: Member.self)
        
        let member = Member(name: "Bob Storage", id: 123, hobby: .snowboarding)
        
        XCTAssertNotEqual(storedMember, self.member)
        XCTAssertNotEqual(self.member, member)
    }
}
