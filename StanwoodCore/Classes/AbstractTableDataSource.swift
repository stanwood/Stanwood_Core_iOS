//
//  AbstractTableDataSource.swift
//  Schneehoehen
//
//  Created by Tal Zion on 19/07/2017.
//  Copyright © 2017 Stanwood. All rights reserved.
//

import UIKit

protocol TableDataSource {
    
    var dataObject:DataType? {get set}
    var dataType: Type? { get set }
    
    func update(with dataObject: DataType?)
    func update(with dataType: Type?)
    
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

extension Stanwood {
    
    /**
     The `AbstractTableDataSource` conforms to the `TableDataSource` protocol and implements `AbstractTableDataSource.numberOfSections(in:)` and `AbstractTableDataSource.tableView(_:numberOfRowsInSection:)`. It midiates the application data model `DataType` and `Type` for the [`UITableView`](https://developer.apple.com/documentation/uikit/uitableview).
     
     >It is requried to subclass `AbstractTableDataSource` and override `AbstractTableDataSource.tableView(_:cellForRowAt:)`
     
     #####Example: DataSource and Delegate design#####
     ````swift
     let items = [Element(id: "1"), Element(id: "2")]
     self.objects = Stanwood.Objects<Element>(items: items)
     
     self.dataSource = ElementDataSource(dataObject: objects)
     self.delegate = ElementDelegate(dataObject: objects)
     
     self.tableView.dataSource = self.dataSource
     self.tableView.delegate = self.delegate
     ````
     
     - SeeAlso:
     
     `AbstractCollectionDelegate`
     
     `Objects`
     
     `DataType`
     
     `Type`
     */
    public class AbstractTableDataSource: NSObject, UITableViewDataSource, TableDataSource {
        
        // MARK: Properties
        
        /// dataObject, a collection of types
        public internal(set) var dataObject:DataType?
        
        /// A single type object t present
        public internal(set) var dataType: Type?
        
        // MARK: Initializers
        
        /**
         Initialise with a collection of types
         
         - Parameters:
            - dataObject: dataObject
         
         - SeeAlso: `DataType`
         */
        public init(dataObject: DataType?) {
            self.dataObject = dataObject
        }
        
        /**
         Initialise with a a single type object.
         
         - Parameters:
            - dataType: DataType
         
         - SeeAlso: `Type`
         */
        public init(dataType: Type) {
            self.dataType = dataType
        }
        
        // MARK: Public functions
        
        /**
         update current dataSource with dataObject.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parameters:
            - dataObject: DataType
         
         - SeeAlso: `Type`
         */
        open func update(with dataObject: DataType?) {
            self.dataObject = dataObject
        }
        
        /**
         update current dataSource with dataType.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parameters:
            - dataType: Type
         
         - SeeAlso: `DataType`
         */
        open func update(with dataType: Type?) {
            self.dataType = dataType
        }

        // MARK: UITableViewDataSource functions
        
        /***/
        public func numberOfSections(in tableView: UITableView) -> Int {
            switch (dataObject, dataType) {
            case (.some, .none):
                return dataObject?.numberOfSections ?? 0
            case (.none, .some):
                return 1
            case (.some, .some):
                fatalError("\(String(describing: type(of: self))) should not have dataType and dataObject at the same time.")
            default:
                return 0
            }
        }
        
        /***/
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            switch (dataObject, dataType) {
            case (.some, .none):
                return dataObject?.numberOfSections ?? 0
            case (.none, .some):
                return 1
            case (.some, .some):
                fatalError("\(String(describing: type(of: self))) should not have dataType and dataObject at the same time.")
            default:
                return 0
            }
        }
        
        /***/
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            fatalError("Must override DataSource cellForItemAtIndexPath")
        }
    }
}
