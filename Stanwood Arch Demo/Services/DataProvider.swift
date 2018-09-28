//
//  DataProvider.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

class DataProvider {
    
    fileprivate let appData: AppData
    fileprivate let networkManager: NetworkManager
    
    init(appData: AppData, networkManager: NetworkManager) {
        
        self.appData = appData
        self.networkManager = networkManager
    }
    
    @discardableResult
    static func fetch<T: Codable>(_ request: Request, useCache: Bool, allowHead: Bool, _ completion: @escaping (T?, Error?) -> Void) -> URLSessionDataTask?{
        
        return NetworkManager.fetchContent(with: request) { (data, response, error, replaceContent) in

            guard error == nil else {
                completion(nil, error)
                return
            }
            
            guard
                let data = data,
                let object: T = self.parseResponse(data)
                else {
                    return
            }
            
            completion(object, nil)
        }
    }
    
    static func parseResponse<T: Codable>(_ data: Data?) -> T? {
        
        guard let data = data else { return nil }
        
        do {
            
            let object = try JSONDecoder().decode(T.self, from: data)
            return object
            
        } catch {
            
            do {
                
                let array = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]
                let dictionary = [Key.items : array]
                let genericData = try JSONSerialization.data(withJSONObject: dictionary, options: [])
                let dataType = try JSONDecoder().decode(T.self, from: genericData)
                return dataType
                
            } catch {
                return nil
            }
        }
    }
}
