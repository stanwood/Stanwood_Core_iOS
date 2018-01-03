//
//  Fillable+UICollectionViewCell.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

/**
 Fillable protocol of type `UICollectionViewCell` used to fill cells with type object
 
 #####Example: Fillable example#####
 ````swift
 cell.fill(with: type)
 ````
 
 - SeeAlso:
 
 `DataType.Type`
 `DataType.DataType`
 */
public protocol Fillable where Self: UICollectionViewCell {
    func fill(with type: Type?)
}

