//
//  Presenter.swift
//  StanwoodCore
//
//  Created by Tal Zion on 20/02/2018.
//

import Foundation

/// Presentable protocol represents a Presentable class in the stanwood architecture
public protocol Presentable {
    
    /// Actionable associatedtype
    associatedtype Actionable
    
    /// Paramaterable associatedtype
    associatedtype Parameterable
    
    /// Viewable associatedtype
    associatedtype Viewable
    
    /// Collection or Table view DataSource associatedtype
    associatedtype DataSource: DataSourceType
    
    /// Collection or Table view Delegate associatedtype
    associatedtype Delegate: DelegateSourceType
    
    /// Collection or Table view DataSource
    var dataSource: DataSource { get set }
    
    /// Collection or Table view Delegate
    var delegate: Delegate { get set }
    
    /**
     Presentable required initialisers
     
     - Parameters:
        - actionable: Actionable type
        - parameterable: Parameterable type
        - viewable: Viewable type
     */
    init(actionable: Actionable, parameterable: Parameterable, viewable: Viewable)
}
