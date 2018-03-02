//
//  UITestingCore.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/02/2018.
//

import Foundation

#if DEBUG

    struct UITestingCore {
        
        private static var items = UITestingCoreVersion(version: UIApplication.shortVersion, windows: [])
        
        private init () { }
        
        static func record(key: String?, string: String?, atElement element: String) {
            guard let rootView = UIApplication.presentedViewController else { return }
            let windowString = String(describing: type(of: rootView))
            
            let element = UITestingCoreElement(key: key ?? "", string: string ?? "", element: element)
            
            if let index = UITestingCore.items.index(forWindow: windowString) {
                var window = UITestingCore.items.windows[index]
                window.elements.append(element)
                UITestingCore.items.append(window)
            } else {
                let window = UITestingCoreWindow(window: windowString, elements: [element])
                UITestingCore.items.append(window)
            }
            
            if let itemData = try? JSONEncoder().encode(UITestingCore.items) {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "com.stanwood.uitesting.didRecordUIElement"), object: itemData)
            }
        }
    }
#endif
