//
//  DisplayControllerWireframe.swift
//  MyTestProject
//
//  Created by AT on 10/17/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

class DisplayControllerWireframe {

    static func makeViewController() -> DisplayControllerViewController {
      return UIStoryboard(name: DisplayControllerViewController.self.identifier, bundle: nil).instantiate(viewController: DisplayControllerViewController.self)
    }

    static func prepare(_ viewController: DisplayControllerViewController, with  actions: DisplayControllerActionable, and parameters: DisplayControllerParameterable) {
    	let presenter =  DisplayControllerPresenter(actionable: actions, parameterable: parameters, viewable: viewController)
        viewController.presenter = presenter
    }

}
