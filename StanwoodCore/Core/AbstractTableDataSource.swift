//
//  AbstractTableDataSource.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit

protocol TableDataSource {
    
    var dataType:DataType? {get set}
    var type: Type? { get set }
    
    func update(with dataType: DataType?)
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
     self.objects = Stanwood.Elements<Element>(items: items)
     
     self.dataSource = ElementDataSource(dataType: objects)
     self.delegate = ElementDelegate(dataType: objects)
     
     self.tableView.dataSource = self.dataSource
     self.tableView.delegate = self.delegate
     ````
     
     - SeeAlso:
     
     `AbstractCollectionDelegate`
     
     `Objects`
     
     `DataType`
     
     `Type`
     */
    open class AbstractTableDataSource: NSObject, UITableViewDataSource, TableDataSource, DataSourceType {
        
        // MARK: Properties
        
        /// dataType, a collection of types
        public internal(set) var dataType: DataType?
        
        /// A single type object to present
        public internal(set) var type: Type?
        
        /// Unavalible
        @available(*, unavailable, renamed: "dataType")
        public internal(set) var dataObject: DataType?
        
        /// :nodoc:
        private weak var delegate: AnyObject?
        
        // MARK: Initializers
        
        /**
         Initialise with a collection of types
         
         - Parameters:
            - dataType: dataType
            - delegate: Optional AnyObject delegate
         
         - SeeAlso: `DataType`
         */
        public init(dataType: DataType?, delegate: AnyObject? = nil) {
            self.dataType = dataType
            self.delegate = delegate
        }
        
        /// Unavalible
        @available(*, unavailable, renamed: "init(dataType:)")
        public init(dataObject: DataType?) {}
        
        /**
         Initialise with a a single type object.
         
         - Parameters:
            - dataType: DataType
         
         - SeeAlso: `Type`
         */
        public init(type: Type) {
            self.type = type
        }
        
        /// Unavalible
        @available(*, unavailable, renamed: "init(type:)")
        public init(dataType: Type) {}
        
        // MARK: Public functions
        
        /**
         update current dataSource with dataType.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parameters:
            - dataType: DataType
         
         - SeeAlso: `Type`
         */
        open func update(with dataType: DataType?) {
            self.dataType = dataType
        }
        
        /**
         update current dataSource with dataType.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parameters:
            - dataType: Type
         
         - SeeAlso: `DataType`
         */
        open func update(with type: Type?) {
            self.type = type
        }

        // MARK: UITableViewDataSource functions
        
        /// :nodoc:
        open func numberOfSections(in tableView: UITableView) -> Int {
            switch (dataType, type) {
            case (.some, .none):
                return dataType?.numberOfSections ?? 0
            case (.none, .some):
                return 1
            case (.some, .some):
                fatalError("\(String(describing: Swift.type(of: self))) should not have dataType and dataType at the same time.")
            default:
                return 0
            }
        }
        
        /// :nodoc:
        open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dataType?[section].numberOfItems ?? (dataType == nil ? 0 : 1)
        }
        
        /// :nodoc:
        open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cellType = dataType?.cellType(forItemAt: indexPath) as? UITableViewCell.Type else { fatalError("You need to subclass Stanwood.Elements and override cellType(forItemAt:)") }
            guard let cell = tableView.dequeue(cellType: cellType, for: indexPath) as? (UITableViewCell & Fillable) else { fatalError("UITableViewCell must conform to Fillable protocol") }
            
            if let delegateableCell = cell as? Delegateble {
                
                if let delegate = delegate {
                    delegateableCell.set(delegate: delegate)
                } else {
                    assert(false, "The cell requires a delegate, you must inject a delegate to proceed. See: init(dataType:delegate:)")
                }
            }
            
            cell.fill(with: dataType?[indexPath])
            return cell
        }
    }
}
