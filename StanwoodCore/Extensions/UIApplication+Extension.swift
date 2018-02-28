//
//  UIApplication+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 28/02/2018.
//

import Foundation

extension UIApplication {
    
    /// Applictaion short veriosn i'e. 2.3.2
    static var shortVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    /// Current presented viewController
    public static var presentedViewController: UIViewController? {
        return topViewController()
    }
    
    private static func topViewController(_ base: UIViewController? = shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        } else if let tab = base as? UITabBarController,
            let selected = tab.selectedViewController {
            return topViewController(selected)
        } else if let presented = base?.presentedViewController {
            return topViewController(presented)
        } else {
            return base
        }
    }
}
