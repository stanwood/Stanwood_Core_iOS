//
//  DataType.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

public protocol Type {
    var id: String? { get set }
}

public protocol DataType {
    var numberOfItems: Int { get }
    var numberOfSections: Int { get }
    subscript(indexPath: IndexPath) -> Type? { get }
    subscript(section: Int) -> DataType { get }
}

