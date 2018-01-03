//
//  Nameable.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

/// Nameable protocol to provide a name property
public protocol Nameable {
    
    /// Object name
    var name: String? { get set }
}
