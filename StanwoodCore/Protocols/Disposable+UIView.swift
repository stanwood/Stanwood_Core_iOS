//
//  Disposable.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

/// Disposable protocol for disposing `UIView`'s from `superviews`
public protocol Disposable where Self: UIView {
    
    /// Remove Self from superview
    func dispose()
}

extension Disposable {
    
    /// Remove Self from superview
    public func dispose() {
        removeFromSuperview()
    }
}
