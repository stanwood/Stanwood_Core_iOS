//
//  DataType.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

/**
 Type is a single object withing a collection of types
 
 - SeeAlso:
    `DataType`
 */
public protocol Type {
    
    /// Returns the object id
    var id: String? { get set }
}

/**
 DataType is an object that stores a collection of types.
 
 - SeeAlso:
    `Type`
 */
public protocol DataType {
    
    /// Returns the number of items
    var numberOfItems: Int { get }
    
    /// Returns the number of sections
    var numberOfSections: Int { get }
    
    /// A subscript to return a type in an indexPath
    subscript(indexPath: IndexPath) -> Type? { get }
    
    /// A subscript to return a collection dataType within a section
    subscript(section: Int) -> DataType { get }
}

