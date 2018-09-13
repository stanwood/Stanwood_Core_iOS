//
//  StorageTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import StanwoodCore

enum Hobbies: String, Codable {
    case snowboarding, learningSwift, playingWithAlexa
}

struct Member: Codable, Equatable {

    let name: String
    let id: Int
    let hobby: Hobbies

    static func ==(lhs: Member, rhs: Member) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name && lhs.hobby == rhs.hobby
    }
}

class StorageTest: XCTestCase {

    var member: Member!
    var otherMember: Member!

    let memberFileName: String = "member"
    let otherMemberFileName: String = "otherMember"

    let membersFileName: String = "members"
    override func setUp() {
        super.setUp()

        member = Member(name: "Bobby Storage", id: 123, hobby: .snowboarding)
        otherMember = Member(name: "Fred McLovin", id: 321, hobby: .snowboarding)

        try? Stanwood.Storage.store(member, to: .documents, as: .json, withName: memberFileName)
        try? Stanwood.Storage.store(member, to: .caches, as: .json, withName: memberFileName)

        try? Stanwood.Storage.store(otherMember, to: .documents, as: .json, withName: otherMemberFileName)
    }

    override func tearDown() {
        super.tearDown()

        try? Stanwood.Storage.remove(memberFileName, of: .json, from: .caches)
        try? Stanwood.Storage.remove(memberFileName, of: .json, from: .documents)
    }

    func testStoredMembers() {

        XCTAssertTrue(Stanwood.Storage.fileExists(memberFileName, of: .json, in: .documents), "checking of member object is saved to documents")

        XCTAssertTrue(Stanwood.Storage.fileExists(memberFileName, of: .json, in: .caches), "checking of member object is saved to caches")
    }

    func testMember() {
        let storedMember = try? Stanwood.Storage.retrieve(memberFileName, of: .json, from: .documents, as: Member.self)
        let cachedMember = try? Stanwood.Storage.retrieve(memberFileName, of: .json, from: .caches, as: Member.self)

        let member = Member(name: "Bobby Storage", id: 123, hobby: .snowboarding)

        XCTAssertEqual(storedMember, member)
        XCTAssertEqual(cachedMember, member)
    }

    func testNotMember() {
        let storedMember = try? Stanwood.Storage.retrieve(otherMemberFileName, of: .json, from: .documents, as: Member.self)

        let member = Member(name: "Bob Storage", id: 123, hobby: .snowboarding)

        XCTAssertNotEqual(storedMember, self.member)
        XCTAssertNotEqual(self.member, member)
    }
}
