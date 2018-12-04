//
//  Elements.swift
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

import Foundation

/// Type, Equatable & Codeable
public typealias Typeable = Type & Equatable

extension Stanwood {
    
    /// Unavalible
    @available(*, unavailable, renamed: "Elements")
    open class Objects<T: Typeable>: Codable {}
    
    /**
     Elements holds an array of element types.
     
     >Important: only supports a single section dataType. For a more complex solution, please conform to the `DataType` protocol.
     
     #####Example: DataSource and Delegate design#####
     
     ````swift
     let items = [Element(id: "1"), Element(id: "2")]
     self.objects = Stanwood.Elements<Element>(items: items)
     
     self.dataSource = ElementsDataSource(dataObject: elements)
     self.delegate = ElementsDelegate(dataObject: elements)
     
     self.collectionView.dataSource = self.dataSource
     self.collectionView.delegate = self.delegate
     ````
     
     - SeeAlso:
     
     `DataType`
     
     `Type`
     
     `Typeable`
     */
    open class Elements<Element: Typeable>: DataType, Codable where Element: Codable {
        
        enum Errors: Error {
            case typeableDoNotConformToCodable
        }
        
        // MARK: Properties
        
        /// Items of elements<Type & Equatable & Codable>
        public var items: [Element]
        
        public static var identifier: String {
            return String(describing: Elements<Element>.self)
        }
        
        // MARK Computet Properties
        
        /// Number of items
        open var numberOfItems: Int {
            return items.count
        }
        
        /**
         Elements only supports a single section.
         
         - Returns: current section
         
         - SeeAlso: `DataType` for multiple section option
         */
        open var numberOfSections: Int {
            return 1
        }
        
        // MARK: Initializers
        
        /**
         Initializer of Elements
         
         - Parameters:
            - items: `[Element]<Type & Equatable & Codable>`
         */
        public init(items: [Element]) {
            self.items = items
        }
        
        // MARK: Subsripts
        
        /**
         Subscript to get an item in row.
         
         - Parameters:
            - indexPath: IndexPath location of an item at row
         
         - Returns: `Optional<Type>`
         
         - SeeAlso: `Type`
         */
        open subscript(indexPath: IndexPath) -> Type? {
            guard indexPath.row < items.count else { return nil }
            return items[indexPath.row]
        }
        
        /**
         Subscript to get a section.
         
         >Important: `Elements` only supports a single section dataType. For a more complex solution, please conform to the `DataType` protocol.
         
         - SeeAlso: `DataType`
         */
        open subscript(section: Int) -> DataType {
            return self
        }
        
        // MARK: Public Functions
        
        /// Returns the cell type at indexPath
        open func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
            return nil
        }
        
        /**
         Append an item or insert at index
         
         - Parameters:
            - item: <Element>[Typeable]
            - index: Index
         */
        public func insert(item: Element, at index: Int) {
            items.insert(item, at: index)
        }
        
        /**
         Append an item or insert at index
         
         - Parameters:
            - item: <Element>[Typeable]
         */
        public func append(_ item: Element) {
            items.append(item)
        }
        
        /**
         Move an item to index.
         
         - Parameters:
            - item: <Element>[Type & Equatable & Codable]
            - index: the index to move the item
         
         - Returns: `Elements`
         */
        public func move(_ item: Element, to index: Int) {
            if let indexToRemove = self.index(of: item) {
                items.remove(at: indexToRemove)
                items.insert(item, at: index)
            }
        }
        
        /**
         Delete an item
         
         - Parameters:
            - item: the item to delete
         
         - Returns: `Elements`
         */
        public func delete(_ item: Element) {
            if let index = index(of: item) {
                items.remove(at: index)
            }
        }
        
        /**
         Get the index of an item.
         
         - Parameters:
            - item: the item to search for in the collection
         
         - Returns: the item index
         */
        public func index(of item: Element) -> Int? {
            return items.index(of: item)
        }
        
        /**
         Checking if objects contain an item.
         
         - Parameters:
            - item: the item to check it it exists.
         
         - Returns: if it exists
         */
        public func contains(_ item: Element) -> Bool {
            return items.contains(item)
        }
        
        // MARK: Persist Data
        
        /**
         Save objects to file
         
         - Parameters:
            - fileName: The file name. If nil, default value String(describing: Elements<Element>.self)`
         */
        open func save(withFileName fileName: String? = nil) throws {
            
            try Storage.store(self, to: .documents, as: .json, withName: fileName ?? Elements<Element>.identifier)
        }
        
        /**
         Returns objects from file if exists
         
         - Parameters:
            - fileName: The file name. If nil, default value String(describing: Elements<T>.self)`
         */
        open static func loadFromFile(withFileName fileName: String? = nil) -> Elements? {
            do {
                return try Stanwood.Storage.retrieve(fileName ?? Elements<Element>.identifier, of: .json, from: .documents, as: Elements<Element>.self)
            } catch {
                return nil
            }
        }
    }
}

