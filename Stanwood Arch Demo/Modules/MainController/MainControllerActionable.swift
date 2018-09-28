//
//  MainControllerActionable.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//


protocol MainControllerActionable {
    func loadDetailController()
}

extension Actions: MainControllerActionable {
   
    func loadDetailController(){
        coordinator.loadDetailController()
    }
}
