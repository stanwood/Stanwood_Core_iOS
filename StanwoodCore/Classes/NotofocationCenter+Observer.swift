//
//  NotofocationCenter+Observer.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

public struct Observer {
    public let selector: Selector
    public let name: Notification.Name
    public let object: Any?
    
    public init(selector: Selector, name: Notification.Name, object: Any? = nil) {
        self.selector = selector
        self.name = name
        self.object = object
    }
}

extension NotificationCenter {
    
    public func addObserver(_ target: Any, observer: Observer) {
        addObserver(target, selector: observer.selector, name: observer.name, object: observer.object)
    }
    
    public func addObservers(_ target: Any, observers: Observer...) {
        observers.forEach() {
            addObserver(target, selector: $0.selector, name: $0.name, object: $0.object)
        }
    }
}
