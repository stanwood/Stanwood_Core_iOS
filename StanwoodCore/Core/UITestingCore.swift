//
//  UITestingCore.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/02/2018.
//

import Foundation

#if DEBUG
    
    public struct UITestingCoreItems: Codable {
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
        
        public func payload() -> [String: Any]? {
            guard let data = try? JSONEncoder().encode(self),
             let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return nil
            }
            return ["version_\(version.replacingOccurrences(of: ".", with: "-"))" : dictionary as Any]
        }
    }
    
    public struct UITestingCoreWindow: Codable, Equatable {
        
        let window: String
        var elements: [UITestingCoreElement] = []
        
        public static func ==(lhs: UITestingCoreWindow, rhs: UITestingCoreWindow) -> Bool {
            return lhs.window == rhs.window
        }
    }
    
    public struct UITestingCoreElement: Codable {

        var key: String
        var string: String
        var element: String
        
        public func payload() -> [String: Any] {
            return [:]
//                 : [
//                    "windows" : [
//                        window : [
//                            "elements" : [
//                                [
//                                    "element" : element,
//                                    "key" : key,
//                                    "string" : string
//                                ]
//                            ]
//
//                        ]
//                    ]
//                ]
//            ]
        }
    }
    
    struct UITestingCore {
        
        private static var items = UITestingCoreItems(version: UIApplication.shortVersion, windows: [])
        
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
