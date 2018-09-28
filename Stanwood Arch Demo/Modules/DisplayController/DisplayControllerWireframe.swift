//
//  DisplayControllerWireframe.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

class DisplayControllerWireframe {
    
    static func makeViewController() -> DisplayControllerViewController {
    	return UIStoryboard.instantiate(viewController: DisplayControllerViewController.self)
    }
    
    static func prepare(_ viewController: DisplayControllerViewController, with  actions: DisplayControllerActionable, and parameters: DisplayControllerParameterable) {
    	let presenter =  DisplayControllerPresenter(actionable: actions, parameterable: parameters, viewable: viewController)
        viewController.presenter = presenter
    }
    
}
