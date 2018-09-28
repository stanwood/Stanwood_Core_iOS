//
//  DisplayControllerActionable.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//


protocol DisplayControllerActionable {
    func showItemWith(items: AwesomeDisplayItems?)
}

extension Actions: DisplayControllerActionable {
    
    func showItemWith(items: AwesomeDisplayItems?){
        coordinator.showItemWith(items: items)
    }
}
