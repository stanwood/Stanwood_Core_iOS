//
//  File.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

/// UITestingCoreItems contains a collection of tracked versions
public struct UITestingCoreItems: Codable {
    
    /// Current tracked versions
    var versions: [UITestingCoreVersion]
    
    /// :nodoc:
    public init(versions: [UITestingCoreVersion]) {
        self.versions = versions
    }
    
    /// Payload dictionary
    public func payload() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return nil
        }
        return dictionary
    }
    
    /**
     Appends a new versios  item
     
     - Parameters:
     - version: `UITestingCoreVersion` version
     
     - SeeAlso: UITestingCoreVersion
     */
    mutating public func append(_ version: UITestingCoreVersion) {
        if versions.contains(version), let index = index(for: version) {
            versions[index] = version
        } else {
            versions.append(version)
        }
    }
    
    /**
     Returns the index of a version item
     
     - Parameters:
     - version: `UITestingCoreVersion` version
     
     - Returns: version index
     
     - SeeAlso: UITestingCoreVersion
     */
    func index(for version: UITestingCoreVersion) -> Int? {
        return versions.index(of: version)
    }
}
