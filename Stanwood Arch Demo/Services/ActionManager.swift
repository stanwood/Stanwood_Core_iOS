//
//  ActionManager.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


extension URL {
    
    var action: Action {
        // This will of course be dynamic in the real world, most often from a deeplink manager
        return Action.showItemWith(items: AwesomeDisplayItems(items:[]))
    }
}

enum Action: Typeable {
   
    static func == (lhs: Action, rhs: Action) -> Bool {
        return lhs.id == rhs.id
    }
    
    case showItemWith(items: AwesomeDisplayItems?)
}

extension Action {
    
    var id: String?{
        get{
            return nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        fatalError("STOP! ---- \n\n ---- You are trying to encode `Action` enum.. plese dont! ---- \n\n ----")
    }
    
    init(from decoder: Decoder) throws {
        fatalError("STOP! ---- \n\n ---- You are trying to init `Action` enum from decoder.. plese dont! ---- \n\n ----")
    }
}
