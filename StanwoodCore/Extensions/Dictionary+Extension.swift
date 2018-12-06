//
//  Dictionary+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


extension Dictionary {
    
    mutating func add(_ otherDictionary: Dictionary) {
        
        for (key,value) in otherDictionary {
            self.updateValue(value, forKey:key)
        }
    }
}
