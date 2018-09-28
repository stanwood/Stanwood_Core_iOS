//
//  Coordinator+Extension.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

extension Coordinator {
    
    func handle(_ action: Action, _ completion: CompletionBlock?){
        
        main {
            
            switch action {
            case .showItemWith(items: let items):
                self.showItemWith(items: items)
            }
        }
    }
}
