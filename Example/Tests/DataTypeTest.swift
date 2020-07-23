//
//  DataTypeTest.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 03/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import StanwoodCore
import SourceModel

class DataTypeTest: XCTestCase {
    
    var objects: Elements<Item>!
    var sections: Sections!
    
    override func setUp() {
        super.setUp()

        let floats: [Item] = [
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.clear", value: "0.0"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.veryLight", value: "0.3"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.light", value: "0.4"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.half", value: "0.5"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.faded", value: "0.7"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.full", value: "1.0"),
            
            Item(title: "CGFloat", subTitle: "Damping", signature: "CGFloat.Damping.low", value: "0.3"),
            Item(title: "CGFloat", subTitle: "Damping", signature: "CGFloat.Damping.medium", value: "0.7"),
            Item(title: "CGFloat", subTitle: "Damping", signature: "CGFloat.Damping.high", value: "1.0"),
            
            Item(title: "CGFloat", subTitle: "Spring", signature: "CGFloat.Spring.low", value: "0.3"),
            Item(title: "CGFloat", subTitle: "Spring", signature: "CGFloat.Spring.medium", value: "0.7"),
            Item(title: "CGFloat", subTitle: "Spring", signature: "CGFloat.Spring.high", value: "1.0"),
            
            Item(title: "CGFloat", subTitle: "Radius", signature: "CGFloat.Radius.tiny", value: "5"),
            Item(title: "CGFloat", subTitle: "Radius", signature: "CGFloat.Radius.small", value: "8"),
            Item(title: "CGFloat", subTitle: "Radius", signature: "`CGFloat.Radius.medium`", value: "15"),
            Item(title: "CGFloat", subTitle: "Radius", signature: "`CGFloat.Radius.large`", value: "20")
        ]
        
        let strings: [Item] = [
            Item(title: "String", subTitle: "String", signature: "\"MY_LOCAL_STRING\".localized", value: "Some Pretty string"),
            Item(title: "String", subTitle: "String", signature: "\"Some Pretty string\".first", value: "Some Pretty string".first),
            Item(title: "String", subTitle: "String", signature: "\"Some Pretty string\".last", value: "Some Pretty string".last),
            Item(title: "String", subTitle: "String", signature: "\"www.here.com\".httpURLString", value: "www.here.com".httpURLString),
            Item(title: "String", subTitle: "String", signature: "\"07976876560\".phoneFormat", value: "07976876560".phoneFormat),
            Item(title: "String", subTitle: "String", signature: "\"myNiceNameHere\".snakeCased()", value: "myNiceNameHere".snakeCased()),
            ]
    
        
        let allFloats = MainItem(items: floats)
        let allStrings = MainItem(items: strings)
        
        sections = Sections(items: [allFloats, allStrings])

        let sectionOne = Elements(items: floats)
        objects = sectionOne

        let sectionTwo = Elements(items: strings)
        sections =  Sections(items: [sectionOne, sectionTwo])

        continueAfterFailure = true
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Test Sections
    
    func testSectionCount() {
        let count = 2
        XCTAssertEqual(sections.numberOfSections, count)
    }
    
    func testCountNumberOfItemsInSectionTwo() {
        let count = 6
        XCTAssertEqual(sections[1].numberOfItems, count)
    }
    
    func testCountNumberOfItemsInSectionOne() {
        let count = 16
        XCTAssertEqual(sections[0].numberOfItems, count)
    }
    
    func testLastSectionItemID() {
        let title = "String"
        
        let indexPath = IndexPath(item: 5, section: 1)
        let item = sections[indexPath] as! Item
        XCTAssertEqual(item.title, title)
    }
    
    func testSectionOneItemID() {
        let subTitle = "Spring"
        
        let indexPath = IndexPath(item: 10, section: 0)
        let item = sections[indexPath] as! Item
        XCTAssertEqual(item.subTitle, subTitle)
    }
    
    // MARK: - Test Elements
    
    func testCount() {
        let count = 16
        XCTAssertEqual(objects.numberOfItems, count)
    }
    
    func testInsert() {
        let object = Item(title: "Test", subTitle: "Item", signature: "Aaron", value: "Is Great")
        let objects = self.objects!
        objects.insert(item: object, at: 7)
        
        XCTAssert(objects.contains(object))
    }
    
    func testContains() {
        let object = Item(title: "Test", subTitle: "Item", signature: "Aaron", value: "Is Likely Better Than Great")
        let objects: Elements<Item> = self.objects
        
        XCTAssertFalse(objects.contains(object))
        
        objects.append(object)
        
        XCTAssert(objects.contains(object))
    }
    
    func testMoveLow() {
        let objects: Elements<Item> = self.objects
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Item
        let movedToIndexPath = IndexPath(item: 7, section: 0)
        
        let from = objects[indexPath] as! Item
        objects.move(objectThree, to: 7)
        let to = objects[movedToIndexPath] as! Item
        
        XCTAssertEqual(from, to)
    }
    
    func testMoveHigh() {
        let elements: Elements<Item> = Elements<Item>(items:  self.objects.items)
        let indexPath = IndexPath(item: 12, section: 0)
        let objectThree = objects[indexPath] as! Item
        let movedToIndexPath = IndexPath(item: 7, section: 0)
        
        let from = elements[indexPath] as! Item
        elements.move(objectThree, to: 7)
        let to = elements[movedToIndexPath] as! Item
        
        XCTAssertEqual(from, to)
    }
    
    func testMoveEnd() {
        let elements: Elements<Item> = Elements<Item>(items:  self.objects.items)
        let indexPath = IndexPath(item: 7, section: 0)
        let objectThree = objects[indexPath] as! Item
        let movedToIndexPath = IndexPath(item: 13, section: 0)
        
        let from = elements[indexPath] as! Item
        elements.move(objectThree, to: 13)
        let to = elements[movedToIndexPath] as! Item
        
        XCTAssertEqual(from, to)
    }
    
    func testDelete() {
        
        let objects: Elements<Item> = self.objects
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Item
        
        XCTAssert(objects.contains(objectThree))
        
        objects.delete(objectThree)
        
        XCTAssertFalse(objects.contains(objectThree))
    }
    
    func testIndex() {
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Item
        
        let index = objects.index(of: objectThree)
        
        XCTAssertEqual(index, 2)
    }
    
    func testDataPersistence() {
        do {
            try objects.save()
            
            let loadedDeals = Elements<Item>.loadFromFile()
            XCTAssertNotNil(loadedDeals)
            
            if let loadedDeals = loadedDeals {
                XCTAssertEqual(objects.numberOfItems, loadedDeals.numberOfItems)
                
                let object = Item(title: "Test", subTitle: "Item", signature: "Aaron", value: "Most Handsome Man?")
                loadedDeals.append(object)
                
                XCTAssertNotEqual(objects.numberOfItems, loadedDeals.numberOfItems)
                
                try loadedDeals.save(withFileName: "objects_file")
                
                let objectsFile = Elements<Item>.loadFromFile(withFileName: "objects_file")
                XCTAssertNotNil(objectsFile)
                
                if let objectsFile = objectsFile {
                    XCTAssertEqual(objectsFile.numberOfItems, loadedDeals.numberOfItems)
                }
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
