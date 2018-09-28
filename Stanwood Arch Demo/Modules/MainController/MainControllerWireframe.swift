//
//  MainControllerWireframe.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

class MainControllerWireframe {
    
    static func makeViewController() -> MainControllerViewController {
    	return UIStoryboard.instantiate(viewController: MainControllerViewController.self)
    }
    
    static func prepare(_ viewController: MainControllerViewController, with  actions: MainControllerActionable, and parameters: MainControllerParameterable) {
    	let presenter =  MainControllerPresenter(actionable: actions, parameterable: parameters, viewable: viewController)
        viewController.presenter = presenter
    }
    
}
