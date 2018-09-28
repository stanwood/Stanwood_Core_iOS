//
//  UIViewController+Extension.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var isModal: Bool {
        return presentingViewController?.presentedViewController == self
            || (navigationController != nil
                && navigationController?.viewControllers.count == 1)
            || tabBarController?.presentingViewController is UITabBarController
    }
    
    func dismissCurrentController(animated animate: Bool = true,forceModal: Bool = false, _ completion: CompletionBlock? = nil){
        
        view.endEditing(true)
        
        if isModal || forceModal {
            dismiss(animated: animate) {
                completion?()
            }
        }else{

            self.navigationController?.popViewController(animated: animate)
        }
    }
}
