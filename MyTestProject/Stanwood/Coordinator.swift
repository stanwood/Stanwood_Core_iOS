//
//  Coordinator.swift
//  MyTestProject
//
//  Created by Aaron Mc Tieguy on 10/16/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinating {
    var window: UIWindow { get }
    var parameters: Parameters! { get set }
    var actions: Actions! { get set }
}

class Coordinator: Coordinating {
    
    let window: UIWindow
    var parameters: Parameters!
    var actions: Actions!

    var currentController: UIViewController{
        
        let topController = UIApplication.presentedViewController
        
        if topController is UIAlertController {
            return topController?.parent ?? UIViewController()
        }
        return UIApplication.presentedViewController ?? UIViewController()
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func configureRootView() {
        // TODO if needed:
        // 1. Configure a TabBarController
        // 2. Configure a NavigationController if needed
        
        let mainController = MainControllerWireframe.makeViewController()
        MainControllerWireframe.prepare(mainController, with: actions, and: parameters)
        
        window.rootViewController = mainController
    }
    
    func loadDisplayController(){
        
        let detailController = DisplayControllerWireframe.makeViewController()
        let navigationController = UINavigationController(rootViewController: detailController)
        DisplayControllerWireframe.prepare(detailController, with: actions, and: parameters)
        currentController.present(navigationController, animated: true, completion: nil)
    }
}
