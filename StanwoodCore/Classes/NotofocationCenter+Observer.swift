//
//  NotofocationCenter+Observer.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

/// A convinient observer class to add observers to `NotificationCenter`
public struct Observer {
    
    /// The observer selector
    public let selector: Selector
    
    /// The notification name
    public let name: Notification.Name
    
    /// The optional object to pass
    public let object: Any?
    
    /**
     A convinient observer class to add observers to `NotificationCenter`
     
     - Parameters:
        - selector: the selector to pass to the notification
        - name: the notification name
        - object: object of type `Any`, default = nil
     
     - SeeAlso:
     `NotificationCenter.addObserver(_:observer:)`
     `NotificationCenter.addObservers(_:observers:)`
     */
    public init(selector: Selector, name: Notification.Name, object: Any? = nil) {
        self.selector = selector
        self.name = name
        self.object = object
    }
}

extension NotificationCenter {
    
    /**
     Add an observer
     
     - Parameters:
        - target: the current target
        - observer: the observer to handle
     
     - SeeAlso: `Observer`
     */
    public func addObserver(_ target: Any, observer: Observer) {
        addObserver(target, selector: observer.selector, name: observer.name, object: observer.object)
    }
    
    /**
     Add observers
     
     - Parameters:
        - target: the current target
        - observers: the observers to handle
     
     - SeeAlso: `Observer`
     */
    public func addObservers(_ target: Any, observers: Observer...) {
        observers.forEach() {
            addObserver(target, selector: $0.selector, name: $0.name, object: $0.object)
        }
    }
}
