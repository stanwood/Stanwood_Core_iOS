//
//  AbstractCollectionDataSource.swift
//  Schneehoehen
//
//  Created by Tal Zion on 19/07/2017.
//  Copyright © 2017 Stanwood. All rights reserved.
//

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
    
    public class AbstractCollectionDataSource: NSObject, UICollectionViewDataSource, CollectionDataSource {

        /// dataObject, a collection of types
        public internal(set) var dataObject:DataType?
        
        /// A single type object t present
        public internal(set) var dataType: Type?
        
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
         
         - SeeAlso: `DataType.Type`
         */
        public init(dataType: Type) {
            self.dataType = dataType
        }
        
        /**
         update current dataSource with dataObject.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parametes:
            - dataObject: DataType
         
         - SeeAlso: `DataType`
         */
        open func update(with dataObject: DataType?) {
            self.dataObject = dataObject
        }
        
        /**
         update current dataSource with dataType.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parametes:
            - dataType: Type
         
         - SeeAlso: `DataType.Type`
         */
        open func update(with dataType: Type?) {
            self.dataType = dataType
        }
        
        public func numberOfSections(in collectionView: UICollectionView) -> Int {
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
        
        public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return dataObject?[section].numberOfItems ?? (dataType == nil ? 0 : 1)
        }
        
        public func collectionView(_ collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: IndexPath) {
            fatalError("Must override DataSource didEndDisplayingCell")
        }
        
        public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            fatalError("Must overide DataSource cellForItemAtIndexPath")
        }
    }
}
