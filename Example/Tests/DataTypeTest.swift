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
    
    var objects: Stanwood.Elements<Deal>!
    var sections: Stanwood.Sections!
    
    override func setUp() {
        super.setUp()
        
        let sectionOneDeals: [Deal] = [
            Deal(id: "1"),
            Deal(id: "2"),
            Deal(id: "3"),
            Deal(id: "4"),
            Deal(id: "5"),
            Deal(id: "6"),
            Deal(id: "7"),
            Deal(id: "8"),
            Deal(id: "9"),
            Deal(id: "10"),
            Deal(id: "11"),
            Deal(id: "12"),
            Deal(id: "13"),
            Deal(id: "14")
        ]
        
        let sectionTwoDeals: [Deal] = [
            Deal(id: "15"),
            Deal(id: "16"),
            Deal(id: "17"),
            Deal(id: "18"),
            Deal(id: "19"),
            Deal(id: "20"),
            Deal(id: "21")
        ]
        
        let sectionOne = Stanwood.Elements(items: sectionOneDeals)
        objects = sectionOne
        
        let sectionTwo = Stanwood.Elements(items: sectionTwoDeals)
        sections =  Stanwood.Sections(items: [sectionOne, sectionTwo])
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Test Stanwood.Sections
    
    func testSectionCount() {
        let count = 2
        XCTAssertEqual(sections.numberOfSections, count)
    }
    
    func testCountNumberOfItemsInSectionTwo() {
        let count = 7
        XCTAssertEqual(sections[1].numberOfItems, count)
    }
    
    func testCountNumberOfItemsInSectionOne() {
        let count = 14
        XCTAssertEqual(sections[0].numberOfItems, count)
    }
    
    func testLastSectionItemID() {
        let id = "21"
        
        let indexPath = IndexPath(item: 6, section: 1)
        let deal = sections[indexPath] as! Deal
        XCTAssertEqual(deal.id, id)
    }
    
    func testSectionOneItemID() {
        let id = "11"
        
        let indexPath = IndexPath(item: 10, section: 0)
        let deal = sections[indexPath] as! Deal
        XCTAssertEqual(deal.id, id)
    }
    
    // MARK: - Test Stanwood.Elements
    
    func testCount() {
        let count = 14
        XCTAssertEqual(objects.numberOfItems, count)
    }
    
    func testInsert() {
        let object = Deal(id: "15")
        let objects = self.objects!
        objects.insert(item: object, at: 7)
        
        XCTAssert(objects.contains(object))
    }
    
    func testContains() {
        let object = Deal(id: "15")
        let objects: Stanwood.Elements<Deal> = self.objects
        
        XCTAssertFalse(objects.contains(object))
        
        objects.append(object)
        
        XCTAssert(objects.contains(object))
    }
    
    func testMoveLow() {
        let objects: Stanwood.Elements<Deal> = self.objects
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Deal
        let movedToIndexPath = IndexPath(item: 7, section: 0)
        
        let from = objects[indexPath] as! Deal
        objects.move(objectThree, to: 7)
        let to = objects[movedToIndexPath] as! Deal
        
        XCTAssertEqual(from, to)
    }
    
    func testMoveHigh() {
        let objects: Stanwood.Elements<Deal> = self.objects
        let indexPath = IndexPath(item: 12, section: 0)
        let objectThree = objects[indexPath] as! Deal
        let movedToIndexPath = IndexPath(item: 7, section: 0)
        
        let from = objects[indexPath] as! Deal
        objects.move(objectThree, to: 7)
        let to = objects[movedToIndexPath] as! Deal
        
        XCTAssertEqual(from, to)
    }
    
    func testDelete() {
        
        let objects: Stanwood.Elements<Deal> = self.objects
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Deal
        
        XCTAssert(objects.contains(objectThree))
        
        objects.delete(objectThree)
        
        XCTAssertFalse(objects.contains(objectThree))
    }
    
    func testIndex() {
        let indexPath = IndexPath(item: 2, section: 0)
        let objectThree = objects[indexPath] as! Deal
        
        let index = objects.index(of: objectThree)
        
        XCTAssertEqual(index, 2)
    }
    
    func testDataPersistence() {
        do {
            try objects.save()
            
            let loadedDeals = Stanwood.Elements<Deal>.loadFromFile()
            XCTAssertNotNil(loadedDeals)
            
            if let loadedDeals = loadedDeals {
                XCTAssertEqual(objects.numberOfItems, loadedDeals.numberOfItems)
                
                let object = Deal(id: "55")
                loadedDeals.append(object)
                
                XCTAssertNotEqual(objects.numberOfItems, loadedDeals.numberOfItems)
                
                try loadedDeals.save(withFileName: "objects_file")
                
                let objectsFile = Stanwood.Elements<Deal>.loadFromFile(withFileName: "objects_file")
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
