//
//  UITestingCoreElement.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

/// UITestingCoreElement represent a button, label, or any view element
public struct UITestingCoreElement: Codable {
    
    /// Element key
    var key: String
    
    /// Element identifier
    var text: String
    
    /// Element description
    var element: String
}

