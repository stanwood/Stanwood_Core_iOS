//
//  TimeInterval+Extension.swift
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

extension TimeInterval {
    
    /// TimeInterval of 0.0
    public static var instant: TimeInterval { return 0 }
    
    /// TimeInterval of 0.001
    public static var superSmall: TimeInterval { return 0.001 }
    
    /// TimeInterval of 0.05
    public static var halfTiny: TimeInterval { return 0.05 }
    
    /// TimeInterval of 0.1
    public static var tiny: TimeInterval { return 0.1 }
    
    /// TimeInterval of 0.2
    public static var quick: TimeInterval { return 0.2 }
    
    /// TimeInterval of 0.3
    public static var normal: TimeInterval { return 0.3 }
    
    /// TimeInterval of 0.4
    public static var middle: TimeInterval { return 0.4 }
    
    /// TimeInterval of 0.5
    public static var medium: TimeInterval { return 0.5 }
    
    /// TimeInterval of 0.8
    public static var mediumSlow: TimeInterval { return 0.8 }
    
    /// TimeInterval of 1.0
    public static var slow: TimeInterval { return 1.0 }
    
    /// TimeInterval of 2.0
    public static var long: TimeInterval { return 2.0 }
    
    /// TimeInterval of 3.0
    public static var wait: TimeInterval { return 3.0 }
}
