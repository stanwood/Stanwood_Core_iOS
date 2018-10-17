//
//  MainControllerActionable.swift
//  MyTestProject
//
//  Created by AT on 10/16/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//


protocol MainControllerActionable {
    func loadDisplayController()
}

extension Actions: MainControllerActionable {
    
    func loadDisplayController(){
        coordinator.loadDisplayController()
    }
}
