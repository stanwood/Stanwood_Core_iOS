//
//  UITestingCoreVersion.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

    /// UITestingCoreVersion records new window events
    public struct UITestingCoreVersion: Codable, Equatable {
        
        /// Tracked version
        var version: String
        
        /// Window items
        var windows: [UITestingCoreWindow] = []
        
        /**
         Appends a new versios  item
         
         - Parameters:
         - window: `UITestingCoreWindow` version
         
         - SeeAlso: UITestingCoreWindow
         */
        mutating func append(_ window: UITestingCoreWindow) {
            if windows.contains(window), let index = index(forWindow: window.window) {
                windows[index] = window
            } else {
                windows.append(window)
            }
        }
        
        /**
         Returns the index of a window item
         
         - Parameters:
         - windowString: current window string
         
         - Returns: window index
         */
        func index(forWindow windowString: String) -> Int? {
            let window = UITestingCoreWindow(window: windowString, elements: [])
            return windows.index(of: window)
        }
        
        /// :nodoc:
        public static func ==(lhs: UITestingCoreVersion, rhs: UITestingCoreVersion) -> Bool {
            return lhs.version == rhs.version
        }
    }
