//
//  File.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

public struct UITestingCoreItems: Codable {
    var versions: [UITestingCoreVersion]
    
    public init(versions: [UITestingCoreVersion]) {
        self.versions = versions
    }
    
    public func payload() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return nil
        }
        return dictionary
    }
    
    mutating public func append(_ version: UITestingCoreVersion) {
        if versions.contains(version), let index = index(for: version) {
            versions[index] = version
        } else {
            versions.append(version)
        }
    }
    
    func index(for version: UITestingCoreVersion) -> Int? {
        return versions.index(of: version)
    }
}
