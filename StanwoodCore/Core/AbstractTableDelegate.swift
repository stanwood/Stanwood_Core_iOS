//
//  AbstractTableDelegate.swift
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

protocol TableDelegate {
    
    var dataType: DataType? { get set }
    var type: Type?{ get set }
    
    func update(with dataType: DataType?)
    func update(with type: Type?)
}

extension Stanwood {
    
    /**
     The `AbstractTableDelegate` conforms to the `TableDelegate` protocol. It allows you to manage the selection and highlighting of items in a collection view and to perform actions on those items. [`UITableView`](https://developer.apple.com/documentation/uikit/uitableview).
     
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
     
     `AbstractTableDataSource`
     
     `Objects`
     
     `DataType`
     
     `Type`
     */
    open class AbstractTableDelegate: NSObject, UITableViewDelegate, TableDelegate, DelegateSourceType {
        
        // MARK: Properties
        
        /// dataType, a collection of types
        public internal(set) var dataType:DataType?
        
        /// A single type object to present
        public internal(set) var type: Type?
        
        /// Unavalible
        @available(*, unavailable, renamed: "dataType")
        public internal(set) var dataObject: DataType?
        
        // MARK: Initializers
        
        /**
         Initialise with a collection of types
         
         - Parameters:
            - dataType: dataType
         
         - SeeAlso: `DataType`
         */
        public init(dataType: DataType?) {
            self.dataType = dataType
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
        
        /// :nodoc:
        open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if let headerable = dataType?[section] as? Headerable,
                let view = headerable.headerView {
                return view.bounds.size.height
            }
            return 0.0
        }
        
        /// :nodoc:
        open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if let headerable = dataType?[section] as? Headerable {
                return headerable.headerView
            }
            return nil
        }
    }
}
