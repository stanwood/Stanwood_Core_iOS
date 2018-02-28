//
//  UITestingCore.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/02/2018.
//

import Foundation

#if DEBUG
    public struct UITestingCoreItem: Codable {
        var key: String?
        var string: String?
        var element: String
    }
    
    struct UITestingCore {
        
        private init () {}
        
        static func record(key: String?, string: String?, atElement element: String) {
            
            let item = UITestingCoreItem(key: key, string: string, element: element)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "com.stanwood.uitesting.didRecordUIElement"), object: item)
        }
    }
#endif
