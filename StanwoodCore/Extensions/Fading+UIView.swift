//
//  Fading+UIView.swift
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

/**
 Fading protocol animates view in and out
 */
public protocol Fading where Self: UIView {
    
    /**
     Fade in Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    func fadeIn(animated: Bool, duration: Double)
    
    /**
     Fade out Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    func fadeOut(animated: Bool, duration: Double)
}

extension Fading {
    
    /**
     Fade in Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    public func fadeIn(animated: Bool = true, duration: Double = 0.5) {
        if animated {
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
                self.alpha = 1.0
            }, completion: nil)
        } else {
            alpha = 1.0
        }
    }
    
    /**
     Fade out Self with animation
     
     - Parameter:
        - animated: add animation
        - duration: animation duration
     */
    public func fadeOut(animated: Bool = true, duration: Double = 0.5) {
        if animated {
            UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
                self.alpha = 0.0
            }, completion: nil)
        } else {
            alpha = 0.0
        }
    }
}
