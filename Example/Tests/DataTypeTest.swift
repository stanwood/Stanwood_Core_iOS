//
//  DataTypeTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 03/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import StanwoodCore

class DataTypeTest: XCTestCase {
    
    var objects: Stanwood.Objects<Object>!
    
    override func setUp() {
        super.setUp()
        
        let items: [Object] = [
            Object(id: "1"),
            Object(id: "2"),
            Object(id: "3"),
            Object(id: "4"),
            Object(id: "5"),
            Object(id: "6"),
            Object(id: "7"),
            Object(id: "8"),
            Object(id: "9"),
            Object(id: "10"),
            Object(id: "11"),
            Object(id: "12"),
            Object(id: "13"),
            Object(id: "14")
        ]
        
        objects = Stanwood.Objects(items: items)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCount() {
        let count = 14
        XCTAssertEqual(objects.numberOfItems, count)
    }
    
    func testInsert() {
        let object = Object(id: "15")
        let objects = self.objects.insert(item: object, at: 7)
        
        XCTAssert(objects.contains(object))
    }
    
    func testContains() {
        let object = Object(id: "15")
        var objects: Stanwood.Objects<Object> = self.objects
        
        XCTAssertFalse(objects.contains(object))
        
        objects = objects.insert(item: object)
        
        XCTAssert(objects.contains(object))
    }
    
    func testMoveLow() {
        var objects: Stanwood.Objects<Object> = self.objects
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Object
        let movedToIndexPath = IndexPath(item: 7, section: 0)
        
        let from = objects[indexPath] as! Object
        objects = objects.move(objectThree, to: 7)
        let to = objects[movedToIndexPath] as! Object
        
        XCTAssertEqual(from, to)
    }
    
    func testMoveHigh() {
        var objects: Stanwood.Objects<Object> = self.objects
        let indexPath = IndexPath(item: 12, section: 0)
        let objectThree = objects[indexPath] as! Object
        let movedToIndexPath = IndexPath(item: 7, section: 0)
        
        let from = objects[indexPath] as! Object
        objects = objects.move(objectThree, to: 7)
        let to = objects[movedToIndexPath] as! Object
        
        XCTAssertEqual(from, to)
    }
    
    func testDelete() {
        
        var objects: Stanwood.Objects<Object> = self.objects
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Object
        
        XCTAssert(objects.contains(objectThree))
        
        objects = objects.delete(objectThree)
        
        XCTAssertFalse(objects.contains(objectThree))
    }
    
    func testIndex() {
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Object
        
        let index = objects.index(of: objectThree)
        
        XCTAssertEqual(index, 2)
    }
}
