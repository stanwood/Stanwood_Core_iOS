//
//  Disposable.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

public protocol Disposable where Self: UIView {
    func dispose()
}

extension Disposable {
    
    public func dispose() {
        removeFromSuperview()
    }
}
