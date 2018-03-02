//
//  UITestingCoreWindow.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

public struct UITestingCoreWindow: Codable, Equatable {
    
    let window: String
    var elements: [UITestingCoreElement] = []
    
    public static func ==(lhs: UITestingCoreWindow, rhs: UITestingCoreWindow) -> Bool {
        return lhs.window == rhs.window
    }
}

