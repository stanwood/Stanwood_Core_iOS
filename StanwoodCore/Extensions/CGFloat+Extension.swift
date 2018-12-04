//
//  CGFloat+Extension.swift
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

extension CGFloat {
    
    // MARK: Alpha
    
    public enum Alpha {
        
        /// Alpha of 0.0
        public static var clear: CGFloat { return 0 }
        
        /// Alpha of 0.3
        public static var veryLight: CGFloat { return 0.3 }
        
        /// Alpha of 0.4
        public static var light: CGFloat { return 0.4 }
        
        /// Alpha of 0.5
        public static var half: CGFloat { return 0.5 }
        
        /// Alpha of 0.7
        public static var faded: CGFloat { return 0.7 }
        
        /// Alpha of 1.0
        public static var full: CGFloat { return 1 }
    }
    
    // MARK: Animation Damping
    
    public enum Damping {
        
        /// Damping of 0.3
        public static var low: CGFloat { return 0.3 }
        
        /// Damping of 0.7
        public static var medium: CGFloat { return 0.7 }
        
        /// Damping of 1.0
        public static var high: CGFloat { return 1 }
    }
    
    // MARK: Animation Spring
    
    public enum Spring {
        
        /// Spring of 0.3
        public static var low: CGFloat { return 0.3 }
        
        /// Spring of 0.7
        public static var medium: CGFloat { return 0.7 }
        
        /// Spring of 1.0
        public static var high: CGFloat { return 1 }
    }
    
    // MARK: Radius
    
    public enum Radius {
        /// Radius of 20
        public static var large: CGFloat { return 20 }
        
        /// Radius of 15
        public static var medium: CGFloat { return 15 }
        
        /// Radius of 8
        public static var small: CGFloat { return 8 }
        
        /// Radius of 5
        public static var tiny: CGFloat { return 5 }
    }
}
