//
//  UIViewController+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UIViewController {
    
    /// ViewController identifier
    open static var identifier: String {
        return String(describing: self)
    }
    
    /**
     Presents viewController using default paramters.
     
     - Parameters:
        - element: Generic type `UIViewController`
        - storyboard: optional storyboard. Default `element.storyboard`
        - animated: `default = true`
     */
    open func present<T: UIViewController>(element: T.Type, storyboard: UIStoryboard? = nil, animated: Bool = true) {
        if let storyboard = storyboard {
            let viewController = storyboard.instantiate(viewController: element.self)
            present(viewController, animated: animated, completion: nil)
        } else if let storyboard = self.storyboard {
            let viewController = storyboard.instantiate(viewController: element.self)
            present(viewController, animated: animated, completion: nil)
        }
    }
}
