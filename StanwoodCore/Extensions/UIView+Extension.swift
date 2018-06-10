//
//  UIView+Extension.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

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
