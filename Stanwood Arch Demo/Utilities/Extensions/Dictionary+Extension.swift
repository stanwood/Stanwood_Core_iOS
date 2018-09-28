//
//  Dictionary+Extension.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    
    var queryParameters: String {
        
        var parts: [String] = []
        
        for (key, value) in self {
            
            let part = String(format: "%@=%@", String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!, String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            
            parts.append(part as String)
        }
        
        return parts.joined(separator: "&")
    }
    
    mutating func add(_ otherDictionary: Dictionary) {
        
        for (key,value) in otherDictionary {
            self.updateValue(value, forKey:key)
        }
    }
}
