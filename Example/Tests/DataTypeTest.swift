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
    
    var objects: Stanwood.Elements<Item>!
    var sections: Stanwood.Sections!
    
//    override func setUp() {
//        super.setUp()
//
//        let sectionOneDeals: [Item] = [
//            Item(id: "1"),
//            Item(id: "2"),
//            Item(id: "3"),
//            Item(id: "4"),
//            Item(id: "5"),
//            Item(id: "6"),
//            Item(id: "7"),
//            Item(id: "8"),
//            Item(id: "9"),
//            Item(id: "10"),
//            Item(id: "11"),
//            Item(id: "12"),
//            Item(id: "13"),
//            Item(id: "14")
//        ]
//
//        let sectionTwoDeals: [Item] = [
//            Item(id: "15"),
//            Item(id: "16"),
//            Item(id: "17"),
//            Item(id: "18"),
//            Item(id: "19"),
//            Item(id: "20"),
//            Item(id: "21")
//        ]
//
//        let sectionOne = Stanwood.Elements(items: sectionOneDeals)
//        objects = sectionOne
//
//        let sectionTwo = Stanwood.Elements(items: sectionTwoDeals)
//        sections =  Stanwood.Sections(items: [sectionOne, sectionTwo])
//
//        continueAfterFailure = true
//    }
    
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        super.tearDown()
//    }
//    
//    // MARK: - Test Stanwood.Sections
//    
//    func testSectionCount() {
//        let count = 2
//        XCTAssertEqual(sections.numberOfSections, count)
//    }
//    
//    func testCountNumberOfItemsInSectionTwo() {
//        let count = 7
//        XCTAssertEqual(sections[1].numberOfItems, count)
//    }
//    
//    func testCountNumberOfItemsInSectionOne() {
//        let count = 14
//        XCTAssertEqual(sections[0].numberOfItems, count)
//    }
//    
//    func testLastSectionItemID() {
//        let id = "21"
//        
//        let indexPath = IndexPath(item: 6, section: 1)
//        let deal = sections[indexPath] as! Item
//        XCTAssertEqual(deal.id, id)
//    }
//    
//    func testSectionOneItemID() {
//        let id = "11"
//        
//        let indexPath = IndexPath(item: 10, section: 0)
//        let deal = sections[indexPath] as! Item
//        XCTAssertEqual(deal.id, id)
//    }
//    
//    // MARK: - Test Stanwood.Elements
//    
//    func testCount() {
//        let count = 14
//        XCTAssertEqual(objects.numberOfItems, count)
//    }
//    
//    func testInsert() {
//        let object = Item(id: "15")
//        let objects = self.objects!
//        objects.insert(item: object, at: 7)
//        
//        XCTAssert(objects.contains(object))
//    }
//    
//    func testContains() {
//        let object = Item(id: "15")
//        let objects: Stanwood.Elements<Item> = self.objects
//        
//        XCTAssertFalse(objects.contains(object))
//        
//        objects.append(object)
//        
//        XCTAssert(objects.contains(object))
//    }
//    
//    func testMoveLow() {
//        let objects: Stanwood.Elements<Item> = self.objects
//        let indexPath = IndexPath(item: 2, section: 0)
//        let objectThree = objects[indexPath] as! Item
//        let movedToIndexPath = IndexPath(item: 7, section: 0)
//        
//        let from = objects[indexPath] as! Item
//        objects.move(objectThree, to: 7)
//        let to = objects[movedToIndexPath] as! Item
//        
//        XCTAssertEqual(from, to)
//    }
//    
//    func testMoveHigh() {
//        let elements: Stanwood.Elements<Item> = Stanwood.Elements<Item>(items:  self.objects.items)
//        let indexPath = IndexPath(item: 12, section: 0)
//        let objectThree = objects[indexPath] as! Item
//        let movedToIndexPath = IndexPath(item: 7, section: 0)
//        
//        let from = elements[indexPath] as! Item
//        elements.move(objectThree, to: 7)
//        let to = elements[movedToIndexPath] as! Item
//        
//        XCTAssertEqual(from, to)
//    }
//    
//    func testMoveEnd() {
//        let elements: Stanwood.Elements<Item> = Stanwood.Elements<Item>(items:  self.objects.items)
//        let indexPath = IndexPath(item: 7, section: 0)
//        let objectThree = objects[indexPath] as! Item
//        let movedToIndexPath = IndexPath(item: 13, section: 0)
//        
//        let from = elements[indexPath] as! Item
//        elements.move(objectThree, to: 13)
//        let to = elements[movedToIndexPath] as! Item
//        
//        XCTAssertEqual(from, to)
//    }
//    
//    func testDelete() {
//        
//        let objects: Stanwood.Elements<Item> = self.objects
//        let indexPath = IndexPath(item: 2, section: 0)
//        let objectThree = objects[indexPath] as! Item
//        
//        XCTAssert(objects.contains(objectThree))
//        
//        objects.delete(objectThree)
//        
//        XCTAssertFalse(objects.contains(objectThree))
//    }
//    
//    func testIndex() {
//        let indexPath = IndexPath(item: 2, section: 0)
//        let objectThree = objects[indexPath] as! Item
//        
//        let index = objects.index(of: objectThree)
//        
//        XCTAssertEqual(index, 2)
//    }
//    
//    func testDataPersistence() {
//        do {
//            try objects.save()
//            
//            let loadedDeals = Stanwood.Elements<Item>.loadFromFile()
//            XCTAssertNotNil(loadedDeals)
//            
//            if let loadedDeals = loadedDeals {
//                XCTAssertEqual(objects.numberOfItems, loadedDeals.numberOfItems)
//                
//                let object = Item(id: "55")
//                loadedDeals.append(object)
//                
//                XCTAssertNotEqual(objects.numberOfItems, loadedDeals.numberOfItems)
//                
//                try loadedDeals.save(withFileName: "objects_file")
//                
//                let objectsFile = Stanwood.Elements<Item>.loadFromFile(withFileName: "objects_file")
//                XCTAssertNotNil(objectsFile)
//                
//                if let objectsFile = objectsFile {
//                    XCTAssertEqual(objectsFile.numberOfItems, loadedDeals.numberOfItems)
//                }
//            }
//        } catch {
//            XCTFail(error.localizedDescription)
//        }
//    }
}
