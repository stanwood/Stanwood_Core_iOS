//
//  Stanwood.swift
//  StanwoodCore
//
//  Created by Tal Zion on 29/12/2017.
//

import Foundation

/**
 Stanwood global
 */
public struct Stanwood {
    
    /// Checking if Snapshot is running.
    public let isRunningSnapshot: Bool = ProcessInfo.processInfo.arguments.contains("-FASTLANE_SNAPSHOT")
}
