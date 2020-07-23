//
//  MainControllerWireframe.swift
//  MyTestProject
//
//  Created by AT on 10/16/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

class MainControllerWireframe {

    static func makeViewController() -> MainControllerViewController {
      return UIStoryboard(name: MainControllerViewController.self.identifier, bundle: nil).instantiate(viewController: MainControllerViewController.self)
    }

    static func prepare(_ viewController: MainControllerViewController, with  actions: MainControllerActionable, and parameters: MainControllerParameterable) {
        let presenter =  MainControllerPresenter(actions: actions, parameters: parameters, view: viewController)
        viewController.presenter = presenter
    }

}
