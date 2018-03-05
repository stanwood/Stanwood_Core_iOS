//
//  UITestingCoreListener.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

/// UITesting listner completion block for view changes
public typealias UITestingListener = (_ item: UITestingCoreVersion) -> Void

/// Core listner contains event items for view changes.
/// A helper class for the UITesting tool
public class UITestingCoreListener: NSObject {
    
    /// Listener singleton
    private var listiner: UITestingListener?
    
    /// :nodoc:
    private var items = UITestingCoreVersion(version: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "", windows: [])
    
    /// :nodoc:
    public override init() {
        super.init()
        
        let observer = Stanwood.Observer(selector: #selector(registerEvents(_:)), name: Notification.Name(rawValue: "com.stanwood.uitesting.didRecordUIElement"))
        NotificationCenter.default.addObserver(self, observer: observer)
    }
    
    /**
     Listen function will listen for view hierarchy changes events
     */
    public func listen(_ completion: @escaping UITestingListener) {
        listiner = completion
    }
    
    /// :nodoc:
    @objc public func registerEvents(_ notification: Notification) {
        guard let dictionary = notification.object as? [String: String],
            let key = dictionary["key"],
            let windowString = dictionary["window"],
            let elementString = dictionary["element"],
            let text = dictionary["text"] else { return }
        
        let element = UITestingCoreElement(key: key, text: text, element: elementString)
        
        if let index = items.index(forWindow: windowString) {
            var window = items.windows[index]
            window.elements.append(element)
            items.append(window)
        } else {
            let window = UITestingCoreWindow(window: windowString, elements: [element])
            items.append(window)
        }
        
        listiner?(items)
    }
}
