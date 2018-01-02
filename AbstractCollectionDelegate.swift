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
    
    public class AbstractCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CollectionDelegate {
        
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
         update current delegate with dataObject.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parametes:
            - dataObject: DataType
         
         - SeeAlso: `DataType`
         */
        open func update(with dataObject: DataType?) {
            self.dataObject = dataObject
        }
        
        /**
         update current delegate with dataType.
         >Note: If data type is a `class`, it is not reqruied to update the dataType.
         
         - Parametes:
            - dataType: Type
         
         - SeeAlso: `DataType.Type`
         */
        open func update(with dataType: Type?) {
            self.dataType = dataType
        }
    }
}
