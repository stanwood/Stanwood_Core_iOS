//
//  UITestingCore.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/02/2018.
//

import Foundation

#if DEBUG
    struct UITestingCore {
        
        private init () {}
        
        static func record(key: String?, text: String?, atElement element: String) {
            guard let rootView = UIApplication.presentedViewController else { return }
            let windowString = String(describing: type(of: rootView))
            
            let recordedDictionary: [String: String] = [
                "window" : windowString,
                "key" : key ?? "",
                "text" : text ?? "",
                "element" : element
            ]
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "com.stanwood.uitesting.didRecordUIElement"), object: recordedDictionary)
        }
    }
#endif
