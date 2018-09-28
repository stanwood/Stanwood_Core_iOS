//
//  Constants.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth


// MARK:- Typealias


// Blocks

typealias FetchResponse = (_ result: Data?, _ response: HTTPURLResponse?, _ error: Error?, _ replaceContent: Bool?) -> Void
typealias CompletionBlock = () -> Void?
typealias LocationBlock = (_ granted: Bool) -> Void?

/// DataSource & Delegate
typealias CollectionDataSource = Stanwood.AbstractCollectionDataSource
typealias CollectionDelegate = Stanwood.AbstractCollectionDelegate
typealias TableDataSource = Stanwood.AbstractTableDataSource
typealias TableDelegate = Stanwood.AbstractTableDelegate

// Dictionaries

typealias StringDictionary = [String : String]

// Config
typealias Firebase = Configurations.FirebaseConfig
typealias EndPoint = Configurations.EndPoint
typealias Headers = Configurations.Headers
typealias Key = Configurations.Key
