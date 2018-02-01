//
//  UIView+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 01/02/2018.
//

import Foundation

extension UIView {
    
    /// UIView identifier
    var identifier: String {
        return String(describing: type(of: self))
    }
    
    /**
     Load nib from bundle.
     
     - Returns: UIView nib
     */
    @discardableResult
    public func loadNibFromOutlet<T : UIView>() -> T? {
        guard let view = Bundle.main.loadNibNamed(identifier, owner: self, options: nil)?[0] as? T else { return nil }
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(from: self)
        return view
    }
    
    /**
     Adding constraints to view
     
     - Parameters:
        - view: UIView to add constraints to.
        - top: Top anchor. default value `0`
     */
    public func addConstraints(from view: UIView, top: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: topAnchor, constant: top),
                view.bottomAnchor.constraint(equalTo: bottomAnchor),
                view.leadingAnchor.constraint(equalTo: trailingAnchor),
                view.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    /**
     Taking a screenshot of the current view state.
     
     - Returns: UIImage screenshot
     */
    public func screenshot() -> UIImage {
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale);
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return screenshot ?? UIImage()
    }
    
    /**
     Adding a shadow effect. 
     
     - Parameters:
        - opacity: The opacity. default value `0.1`
        - colour: The color. default value `.darkGray`
        - radius: The radius. default value `8`
        - offset: The offset: default value CGSize(width: 0.0, height: 6.0)
     */
    public func addShadow(withOpacity opacity: CGFloat = 0.1, withColour colour: UIColor = .darkGray, withRadius radius: CGFloat = 8, withOffset offset: CGSize = CGSize(width: 0.0, height: 6.0)) {
        layer.masksToBounds = true
        layer.shadowColor = colour.cgColor
        layer.shadowOpacity = Float(opacity)
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shouldRasterize = false
    }
}
