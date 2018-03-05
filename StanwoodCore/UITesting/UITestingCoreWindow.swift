//
//  UITestingCoreWindow.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

/// UITestingCoreWindow records current window elements, i'e. buttons, textViews, labels, etc...
public struct UITestingCoreWindow: Codable, Equatable {
    
    /// Window description
    let window: String
    
    /// Window elements loaded in the window hierarchy
    var elements: [UITestingCoreElement] = []
    
    /// :nodoc:
    public static func ==(lhs: UITestingCoreWindow, rhs: UITestingCoreWindow) -> Bool {
        return lhs.window == rhs.window
    }
}

