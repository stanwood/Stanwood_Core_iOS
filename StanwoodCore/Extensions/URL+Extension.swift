//
//  URL+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


extension URL {
    
    var queryParameters: [String : String]? {
        
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems
            else {
                return nil
        }
        
        var parameters = [String: String]()
        
        for item in queryItems {
            
            parameters[item.name] = item.value
        }
        
        return parameters
    }
    
    func value(for key: String) -> String{
        
        guard
            let queryParameters = queryParameters,
            let item = queryParameters[key]
            else{
                return ""
        }
        return item
    }
}
