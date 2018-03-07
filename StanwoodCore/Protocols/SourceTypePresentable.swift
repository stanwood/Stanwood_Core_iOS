//
//  SourceTypePresentable.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/02/2018.
//

import Foundation

/// SourceTypePresentable protocol represents a Presentable class in the stanwood architecture
public protocol SourceTypePresentable {
    
    /// Collection or Table view DataSource associatedtype
    associatedtype DataSource: DataSourceType
    
    /// Collection or Table view Delegate associatedtype
    associatedtype Delegate: DelegateSourceType
    
    /// Collection or Table view DataSource
    var dataSource: DataSource { get set }
    
    /// Collection or Table view Delegate
    var delegate: Delegate { get set }
}
