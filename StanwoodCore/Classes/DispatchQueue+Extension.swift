//
//  DispatchQueue+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

/**
 Convinience main block
 
 #####Example: A simple `main` block#####
 ````swift
 main {
    // UI updates
 }
 ````
 
 - Paramaters:
    - deadline: `DispatchTimeInterval` default = nil
 */
public func main(deadline: DispatchTimeInterval? = nil, block: @escaping () -> Void) {
    
    if let deadline = deadline {
        DispatchQueue.main.asyncAfter(deadline: .now() + deadline) {
            block()
        }
    } else {
        DispatchQueue.main.async {
            block()
        }
    }
}

extension DispatchQueue {
    
    private static var _onceTracker = [String]()
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - Parameters:
        - block: Block to execute once
     
     - SeeAlso: `once(token:block:)`
     */
    public class func once(file: String = #file, function: String = #function, line: Int = #line, block:()->Void) {
        let token = file + ":" + function + ":" + String(line)
        once(token: token, block: block)
    }
    
    /**
     Executes a block of code, associated with a unique token, only once.  The code is thread safe and will
     only execute the code once even in the presence of multithreaded calls.
     
     - Parameters:
        - token: A unique reverse DNS style name such as io.stanwood.<name> or a GUID
        - block: Block to execute once
     */
    public class func once(token: String, block:()->Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        
        if _onceTracker.contains(token) {
            return
        }
        
        _onceTracker.append(token)
        block()
    }
}
