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
     load `UIView` from xib
     
     - Parameters:
        - frame: CGRect default = nil
        - bundle: default = Bundle.main
     */
    public static func loadFromXib(withFrame frame: CGRect? = nil, bundle: Bundle = Bundle.main) -> Self? {
        guard let view = bundle.loadNibNamed(staticIdentifier, owner: nil, options: nil)?.last as? Self else { return nil }
        view.frame = frame ?? view.frame
        return view
    }
    
    /**
     load `UIView` from outlet
     
     - Parameters:
        - bundle: default = Bundle.main
     */
    @discardableResult
    public func loadFromOutlet(bundle: Bundle = Bundle.main) -> Self? {
        guard let view = bundle.loadNibNamed(identifier, owner: nil, options: nil)?.last as? Self else { return nil }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(from: self)
        return view
    }

    /***/
    private static var staticIdentifier: String {
        return String(describing: self)
    }
    
    /***/
    private var identifier: String {
        return String(describing: type(of: self))
    }
}

