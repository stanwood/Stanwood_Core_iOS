//
//  CodingBridge.swift
//  StanwoodCore
//
//  Created by Tal Zion on 20/02/2018.
//

import Foundation

extension Stanwood {
    /// Coding bridge is a helper struct that bridge NSCoding and Codable objects
    public struct CodingBridge<Coding>: Codable where Coding: NSCoding {
        
        /// Coding object
        public var coding: Coding?
        
        public init(_ coding: Coding?) { self.coding = coding }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            let data = try container.decode(Data.self)
            
            
            if Coding.self == UIImage.self {
                guard let object = UIImage(data: data) else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "failed to unarchive an object")
                }
                
                self.coding = object as? Coding
                return
            } else {
                guard let object = NSKeyedUnarchiver.unarchiveObject(with: data) else {
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "failed to unarchive an object")
                }
                
                guard let wrapped = object as? Coding else {
                    throw DecodingError.typeMismatch(Coding.self, DecodingError.Context(codingPath: container.codingPath, debugDescription: "unarchived object type was \(type(of: object))"))
                }
                self.coding = wrapped
            }
            
            
        }
        
        public func encode(to encoder: Encoder) throws {
            guard let coding = coding else { return }
            
            var data: Data
            if let image = coding as? UIImage {
                data = UIImagePNGRepresentation(image) ??
                    NSKeyedArchiver.archivedData(withRootObject: coding)
            } else {
                data = NSKeyedArchiver.archivedData(withRootObject: coding)
            }
            var container = encoder.singleValueContainer()
            try container.encode(data)
        }
    }
}
