//
//  UITestingCoreVersion.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

public struct UITestingCoreVersion: Codable, Equatable {
    
    var version: String
    var windows: [UITestingCoreWindow] = []
    
    mutating func append(_ window: UITestingCoreWindow) {
        if windows.contains(window), let index = index(forWindow: window.window) {
            windows[index] = window
        } else {
            windows.append(window)
        }
    }
    
    func index(forWindow windowString: String) -> Int? {
        let window = UITestingCoreWindow(window: windowString, elements: [])
        return windows.index(of: window)
    }
    
    public static func ==(lhs: UITestingCoreVersion, rhs: UITestingCoreVersion) -> Bool {
        return lhs.version == rhs.version
    }
}
