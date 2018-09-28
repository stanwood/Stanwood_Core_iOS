//
//  DisplayControllerParameterable.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

protocol DisplayControllerParameterable {
    var funkyObjects: FunkyObjects! { get }
    func item(with id: String?) -> AwesomeDisplayItem?
}

extension Parameters: DisplayControllerParameterable {
  
    var funkyObjects: FunkyObjects! {
        return appData.funkyObjects
    }
    
    
    func item(with id: String?) -> AwesomeDisplayItem?{
        
        guard let id = id else { return nil }

        return appData.awesomeDisplayItems.items.filter({ $0.id == id }).first
    }
}
