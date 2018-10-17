//
//  Configurations.swift
//  MyTestProject
//
//  Created by Aaron Mc Tieguy on 10/16/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

class Configurations {
    
    enum FirebaseConfig: String {
        
        // Remove
        case `default`
        
        static var isRemoteConfigActivated: Bool = false
        
        static func value<T: Any>(for key: FirebaseConfig) -> T? {
            let value = RemoteConfig.remoteConfig()[key.rawValue]
            
            switch T.self {
            case is String.Type: return value.stringValue as? T
            case is [String].Type: return value.stringValue?.toArray as? T
            case is Data.Type: return value.dataValue as? T
            case is Bool.Type: return value.boolValue as? T
            case is Int.Type: return value.numberValue?.intValue as? T
            default: return nil
            }
        }
    }
    
    static func fetchRemoteConfig() {
        RemoteConfig.remoteConfig().setDefaults(fromPlist: Constants.FirebaseConfig.defaults)
        RemoteConfig.remoteConfig().fetch { (status, error) in
            switch status {
            case .success:
                RemoteConfig.remoteConfig().activateFetched()
                Configurations.FirebaseConfig.isRemoteConfigActivated = true
            case .failure, .noFetchYet, .throttled:
                if let error = error as NSError? {
                    // track error
                }
                DispatchQueue.global(qos: .utility).async {
                    Configurations.fetchRemoteConfig()
                }
            }
        }
    }
}
