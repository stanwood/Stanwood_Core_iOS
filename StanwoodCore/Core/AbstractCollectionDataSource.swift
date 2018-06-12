//
//  AbstractCollectionDataSource.swift
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

protocol CollectionDataSource: class {
    
    var dataObject:DataType? { get set }
    var dataType: Type? { get set }
    
    func update(with dataObject: DataType?)
    func update(with dataType: Type?)
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

extension Stanwood {
    
    /**
     The `AbstractCollectionDataSource` conforms to the `CollectionDataSource` protocol and implements `AbstractCollectionDataSource.numberOfSections(in:)` and `AbstractCollectionDataSource.collectionView(_:numberOfItemsInSection:)`. It midiates the application data model `DataType` and `Type` for the [`UICollectionView`](https://developer.apple.com/documentation/uikit/uicollectionview).
     
     >It is requried to subclass `AbstractCollectionDataSource` and override `AbstractCollectionDataSource.collectionView(_:cellForItemAt:)`
     
     #####Example: DataSource and Delegate design#####
     ````swift
     let items = [Element(id: "1"), Element(id: "2")]
     self.objects = Stanwood.Elements<Element>(items: items)
     
     self.dataSource = ElementDataSource(dataObject: objects)
     self.delegate = ElementDelegate(dataObject: objects)
     
     self.collectionView.dataSource = self.dataSource
     self.collectionView.delegate = self.delegate
     ````

     - SeeAlso:
     
     `AbstractCollectionDelegate`
     
     `Objects`
     
     `DataType`
     
     `Type`
     */
    open class AbstractCollectionDataSource: NSObject, UICollectionViewDataSource, CollectionDataSource, DataSourceType {

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
        
        // MARK: UICollectionViewDataSource functions
        
        /// :nodoc:
        open func numberOfSections(in collectionView: UICollectionView) -> Int {
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
        
        /// :nodoc:
        open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dataObject?[section].numberOfItems ?? (dataType == nil ? 0 : 1)
        }
        
        /// :nodoc:
        open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cellType = dataObject?.cellType(forItemAt: indexPath) as? UICollectionViewCell.Type else { fatalError("You need to subclass Stanwood.Elements and override cellType(forItemAt:)") }
            guard let cell = collectionView.dequeue(cellType: cellType, for: indexPath) as? (UICollectionViewCell & Fillable) else { fatalError("UICollectionViewCell must conform to Fillable protocol") }
            cell.fill(with: dataObject?[indexPath.section][indexPath])
            return cell
        }
    }
}
