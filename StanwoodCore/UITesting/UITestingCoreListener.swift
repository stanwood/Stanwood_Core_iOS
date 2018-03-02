//
//  UITestingCoreListener.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

#if DEBUG
    public typealias UITestingListener = (_ item: UITestingCoreVersion) -> Void
    
    public class UITestingCoreListener: NSObject {
        
        private var listiner: UITestingListener?
        
        public override init() {
            super.init()
            
            let observer = Stanwood.Observer(selector: #selector(registerEvents(_:)), name: Notification.Name(rawValue: "com.stanwood.uitesting.didRecordUIElement"))
            NotificationCenter.default.addObserver(self, observer: observer)
        }
        
        public func listen(_ completion: @escaping UITestingListener) {
            
            listiner = completion
        }
        
        @objc public func registerEvents(_ notification: Notification) {
            guard let itemData = notification.object as? Data,
            let item = try? JSONDecoder().decode(UITestingCoreVersion.self, from: itemData) else { return }
            listiner?(item)
        }
    }
    
#endif
