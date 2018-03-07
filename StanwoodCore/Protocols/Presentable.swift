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
    
    /// Actionable property
    var actionable: Actionable { get set }
    
    /// Parameterable property
    var paramaterable: Parameterable { get set }
    
    /// Viewable property
    var viewable: Viewable { get set }
    
    /**
     Presentable required initialisers
     
     - Parameters:
        - actionable: Actionable type
        - parameterable: Parameterable type
        - viewable: Viewable type
     */
    init(actionable: Actionable, parameterable: Parameterable, viewable: Viewable)
}
