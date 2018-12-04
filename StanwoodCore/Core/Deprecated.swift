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
    
    @available(*, unavailable, renamed: "CGFloat.Alpha.clear")
    public static var clear: CGFloat { return 0 }
    
    @available(*, unavailable, renamed: "CGFloat.Alpha.veryLight")
    public static var veryLight: CGFloat { return 0.3 }
    
    @available(*, unavailable, renamed: "CGFloat.Alpha.light")
    public static var light: CGFloat { return 0.4 }
    
    @available(*, unavailable, renamed: "CGFloat.Alpha.half")
    public static var half: CGFloat { return 0.5 }
    
    @available(*, unavailable, renamed: "CGFloat.Alpha.faded")
    public static var faded: CGFloat { return 0.7 }
    
    @available(*, unavailable, renamed: "CGFloat.Alpha.full")
    public static var full: CGFloat { return 1 }
    
    
    // MARK: Animation Damping
    
    @available(*, unavailable, renamed: "CGFloat.Damping.low")
    public static var lowDamping: CGFloat { return 0.3 }
    
    
    @available(*, unavailable, renamed: "CGFloat.Damping.medium")
    public static var mediumDamping: CGFloat { return 0.7 }
    
    
    @available(*, unavailable, renamed: "CGFloat.Damping.high")
    public static var highDamping: CGFloat { return 1 }
    
    
    // MARK: Animation Spring
    
    
    
    @available(*, unavailable, renamed: "CGFloat.Spring.low")
    public static var lowSpring: CGFloat { return 0.3 }
    
    
    @available(*, unavailable, renamed: "CGFloat.Spring.medium")
    public static var mediumSpring: CGFloat { return 0.7 }
    
    
    @available(*, unavailable, renamed: "CGFloat.Spring.high")
    public static var highSpring: CGFloat { return 1 }
    
    
    // MARK: Radius
    
    
    
    @available(*, unavailable, renamed: "CGFloat.Radius.large")
    public static var largeRadius: CGFloat { return 20 }
    
    
    @available(*, unavailable, renamed: "CGFloat.Radius.medium")
    public static var mediumRadius: CGFloat { return 15 }
    
    
    @available(*, unavailable, renamed: "CGFloat.Radius.small")
    public static var smallRadius: CGFloat { return 8 }
    
    
    @available(*, unavailable, renamed: "CGFloat.Radius.tiny")
    public static var tinyRadius: CGFloat { return 5 }
    
}
