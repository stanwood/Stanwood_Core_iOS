//
//  Lodable.swift
//  StanwoodCore
//
//  Created by Tal Zion on 03/01/2018.
//

import Foundation

/// Lodable protocol to load from nib
public protocol Loadable { }

extension UIView: Loadable { }

public extension Loadable where Self: UIView {
    
    /**
     load `UIView` from nib
     
     - Parameters:
        - frame: CGRect default = nil
     */
    public static func loadFromNib<T: UIView>(withFrame frame: CGRect? = nil) -> T? {
        guard let view = Bundle.main.loadNibNamed(identifier, owner: nil, options: nil)!.last as? T else {
            return nil
        }
        view.frame = frame ?? view.frame
        return view
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}

