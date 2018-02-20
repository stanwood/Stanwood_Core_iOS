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
     Adding constraints to view
     
     - Parameters:
        - view: UIView to add constraints to.
        - top: Top anchor. default value `0`
     */
    public func addConstraints(from view: UIView, top: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: view.topAnchor, constant: top),
                bottomAnchor.constraint(equalTo: view.bottomAnchor),
                leadingAnchor.constraint(equalTo: view.leadingAnchor),
                trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
        - opacity: The opacity. default value `0.35`
        - colour: The color. default value `.black`
        - radius: The radius. default value `5`
        - offset: The offset: default value CGSize(width: 0.0, height: 2.0)
     */
    public func addShadow(withOpacity opacity: Float = 0.35, withColour colour: UIColor = .black, withRadius radius: CGFloat = 5, withOffset offset: CGSize = CGSize(width: 0.0, height: 2.0)) {
        layer.masksToBounds = false
        layer.shadowColor = colour.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shouldRasterize = false
    }
}
