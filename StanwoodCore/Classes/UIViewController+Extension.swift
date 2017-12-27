//
//  UIViewController+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UIViewController {
    
    public static var identifier: String {
        return String(describing: self)
    }
    
    public func present<T: UIViewController>(element: T.Type, storyboard: UIStoryboard? = nil, animated: Bool = true) {
        if let storyboard = storyboard {
            let viewController = storyboard.instantiate(viewController: element.self)
            present(viewController, animated: animated, completion: nil)
        } else if let storyboard = self.storyboard {
            let viewController = storyboard.instantiate(viewController: element.self)
            present(viewController, animated: animated, completion: nil)
        }
    }
}
