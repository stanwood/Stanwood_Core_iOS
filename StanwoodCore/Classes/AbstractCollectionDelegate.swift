//
//  AbstractCollectionDelegate.swift
//  Schneehoehen
//
//  Created by Tal Zion on 19/07/2017.
//  Copyright © 2017 Stanwood. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionDelegate {
    
    var dataObject: DataType? { get set }
    var dataType: Type? { get set }
    
    func update(with dataObject: DataType?)
    func update(with dataType: Type?)
}

extension Stanwood {
    
    /**
     The `AbstractCollectionDelegate` conforms to the `CollectionDelegate` protocol. It allows you to manage the selection and highlighting of items in a collection view and to perform actions on those items. [`UICollectionView`](https://developer.apple.com/documentation/uikit/uicollectionview).
     
     #####Example: DataSource and Delegate design#####
     ````swift
     let items = [Element(id: "1"), Element(id: "2")]
     self.objects = Stanwood.Objects<Element>(items: items)
     
     self.dataSource = ElementDataSource(dataObject: objects)
     self.delegate = ElementDelegate(dataObject: objects)
     
     self.collectionView.dataSource = self.dataSource
     self.collectionView.delegate = self.delegate
     ````
     
     - SeeAlso:
     
     `AbstractCollectionDataSource`
     
     `Objects`
     
     `DataType`
     
     `Type`
     */
    public class AbstractCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CollectionDelegate {
        
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
         
         - SeeAlso: `DataType.Type`
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
    }
}
