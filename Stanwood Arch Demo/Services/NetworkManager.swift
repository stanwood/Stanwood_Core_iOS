//
//  NetworkManager.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import Firebase
import UIKit
import FirebaseAuth

class NetworkManager {
    
    @discardableResult
    class func fetchContent(with request: Request,_ completion: FetchResponse?)  -> URLSessionDataTask?{
        
        StanwoodCore.main {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        guard let urlRequest = createMutableRequst(from: request) else {
                completion?(nil, nil, nil, false)
                StanwoodCore.main {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                return nil
        }
        
        return perform(urlRequest, with: completion)
    }
    
    
    class func createMutableRequst(from request: Request) -> URLRequest? {
        
        guard
            let baseURL = request.url,
            let endPoint = request.endPoint,
            let url = URL(string: "\(baseURL)\(endPoint)")
            else{
                return nil
        }
        
        var mutableURL = url
        
        /// Paramaters
        if let params = request.parameters {
            mutableURL = mutableURL.appendingQueryParameters(params)
        }
        
        /// Request
        var urlRequest = URLRequest(url: mutableURL)
                
        /// Headers
        if let headers = request.headers {
            
            for header in headers {
                
                urlRequest.addValue(header.value, forHTTPHeaderField: header.field)
            }
        }
        
        if let body = request.body {
            urlRequest.httpBody = body
        }
        
        return urlRequest
    }
    
    @discardableResult
    class func perform(_ request: URLRequest,
                       with completion: FetchResponse?) -> URLSessionDataTask?{
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            main {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            guard error == nil else {

                completion?(data, response as! HTTPURLResponse?, error, false)
                return
            }
                        
            completion?(data, response as! HTTPURLResponse?, nil, false)

            session.finishTasksAndInvalidate()
        })
 
        task.resume()
        
        return task
    }
}
