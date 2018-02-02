//
//  Fillable+UICollectionViewCell.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

protocol ForceFillabel {}
extension UICollectionViewCell: ForceFillabel {}
extension UITableViewCell: ForceFillabel {}

/**
 Fillable protocol of type `UICollectionViewCell` used to fill cells with type object
 
 #####Example: Fillable example#####
 ````swift
 cell.fill(with: type)
 ````
 
 - SeeAlso:
 
 `Type`
 `DataType`
 */
public protocol Fillable where Self: ForceFillabel {
    
    /**
     Fill current cell with element
     
     - Parameters:
        - type: the element type
     */
    func fill(with type: Type?)
}

