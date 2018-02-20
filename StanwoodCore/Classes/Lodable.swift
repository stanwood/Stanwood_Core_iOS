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

/// Loadbale to laod nib from file
public extension Loadable where Self: UIView {
    
    /**
     load `UIView` from nib
     
     - Parameters:
        - frame: CGRect default = nil
        - bundle: default = Bundle.main
     */
    public static func loadFromNib(withFrame frame: CGRect? = nil, bundle: Bundle = Bundle.main) -> Self? {
        guard let view = bundle.loadNibNamed(identifier, owner: nil, options: nil)?.last as? Self else {
            return nil
        }
        view.frame = frame ?? view.frame
        return view
    }

    static var identifier: String {
        return String(describing: self)
    }
}

