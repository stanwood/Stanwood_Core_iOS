//
//  RequestManager.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

enum RequestType {
    case feed(parameters: StringDictionary?, appData: AppData)
}

struct Header {
    var value:String = ""
    var field:String = ""
}

struct Request{
    
    var url: String?
    var endPoint: String?
    var parameters: StringDictionary?
    var headers: [Header]?
    var requestType: String?
    var body: Data?
    
    
    
    init(url: String? = Configurations.baseURL, endPoint: String?, parameters: StringDictionary? = nil, headers:  [Header]? = [Header(value: "token", field: "fewf324r32r32r32r3r")], requestType: String? = Configurations.HTTPMethod.get, body: Data? = nil) {
        
        self.url = url
        self.endPoint = endPoint
        self.parameters = parameters
        self.headers = headers
        self.requestType = requestType
        self.body = body
    }
}


struct RequestManager {
    
    static func buildRequest(for type: RequestType) -> Request{
        
        switch type {
        case .feed(let parameters, let appData):
            
            let request = Request(endPoint: Configurations.EndPoint.mainFeed, parameters: parameters)
           
            return Request(endPoint: Configurations.EndPoint.mainFeed, parameters: parameters)
        }
    }
}

