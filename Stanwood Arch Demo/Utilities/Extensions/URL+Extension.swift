//
//  URL+Extension.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


extension URL {
    
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        
        let URLString = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
    
    var queryParameters: StringDictionary? {
        
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
