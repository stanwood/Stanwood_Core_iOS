//
//  Error+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


extension NSError {
    
    convenience init(withMessage message:String, withDomain domain: String = "de.stanwood.error", withCode code: Int? = 0, withLog log: String? = "Error") {
        
        let userInfo: [AnyHashable : Any] = [NSLocalizedDescriptionKey :  message , NSLocalizedFailureReasonErrorKey : log ?? message]
        self.init(domain: domain, code: code ?? 0, userInfo: (userInfo as! [String : Any]))
    }
    
    
    convenience init(with error:Error?, withDomain domain: String = "de.stanwood.error", withCode code: Int? = 0, withLog log: String? = "Error") {
        let message = error?.localizedDescription ?? ""
        let userInfo: [AnyHashable : Any] = [NSLocalizedDescriptionKey :  message , NSLocalizedFailureReasonErrorKey : log ?? message]
        self.init(domain: domain, code: code ?? 0, userInfo: (userInfo as! [String : Any]))
    }
}

extension Error {
    
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
