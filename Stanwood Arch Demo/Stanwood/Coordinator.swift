//
//  Coordinator .swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import UIKit


class Coordinator {
    
    
    // MARK:- Properties
    
    
    let window: UIWindow
    var parameters: Parameters!
    var actions: Actions!
    
    var currentController: UIViewController{
        return Coordinator.currentController
    }
    
    static var currentController: UIViewController{
        
        let topController = UIApplication.presentedViewController
        
        if topController is UIAlertController {
            return topController?.parent ?? UIViewController()
        }
        return UIApplication.presentedViewController ?? UIViewController()
    }
    
    
    // MARK:- Initialisers
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK:- Functions
    
    
    func showItemWith(items: AwesomeDisplayItems?){
        
        let detailCollectionController = DetailCollectionWireframe.makeViewController()
        
        guard let items = items else { return }
        
        let customParameters = DetailParameters(with: items, appData: parameters.appData)
        
        DetailCollectionWireframe.prepare(detailCollectionController, with: actions, and: customParameters)
        
        main { [weak self] in
            self?.currentController.navigationController?.pushViewController(detailCollectionController, animated: true)
        }
    }
    
    func loadInitialController(){
        
        let mainController = MainControllerWireframe.makeViewController()
        MainControllerWireframe.prepare(mainController, with: actions, and: parameters)
        
        window.rootViewController = mainController
    }
    
    func loadDetailController(){
        
        let detailController = DisplayControllerWireframe.makeViewController()
        let navigationController = UINavigationController(rootViewController: detailController)
        DisplayControllerWireframe.prepare(detailController, with: actions, and: parameters)
        currentController.present(navigationController, animated: true, completion: nil)
    }
}

