//
//  UIDevice+Extension.swift
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

/// Apple device model names
public enum Model : String {
    
    /// simulator/sandbox
    case simulator   = "simulator/sandbox"
    
    /// iPod 1
    case iPod1            = "iPod 1"
    
    /// iPod 2
    case iPod2            = "iPod 2"
    
    /// iPod 3
    case iPod3            = "iPod 3"
    
    /// iPod 4
    case iPod4            = "iPod 4"
    
    /// iPod 5
    case iPod5            = "iPod 5"
    
    /// iPad 2
    case iPad2            = "iPad 2"
    
    /// iPad 3
    case iPad3            = "iPad 3"
    
    /// iPad 4
    case iPad4            = "iPad 4"
    
    /// iPhone 4
    case iPhone4          = "iPhone 4"
    
    /// iPhone 4S
    case iPhone4S         = "iPhone 4S"
    
    /// iPhone 5
    case iPhone5          = "iPhone 5"
    
    /// iPhone 5S
    case iPhone5S         = "iPhone 5S"
    
    /// iPhone 5C
    case iPhone5C         = "iPhone 5C"
    
    /// iPad Mini 1
    case iPadMini1        = "iPad Mini 1"
    
    /// iPad Mini 2
    case iPadMini2        = "iPad Mini 2"
    
    /// iPad Mini 3
    case iPadMini3        = "iPad Mini 3"
    
    /// iPad Air 1
    case iPadAir1         = "iPad Air 1"
    
    /// iPad Air 2
    case iPadAir2         = "iPad Air 2"
    
    ///  iPad mini 4 (WiFi)
    case iPadmini4WiFi = "iPad mini 4 (WiFi)"
    
    /// 4th Gen iPad mini (WiFi+Cellular)
    case iPadmini4thGenWiFiCellular = "4th Gen iPad mini (WiFi+Cellular)"
    
    /// iPad Air 2 (WiFi)
    case iPadAir2WiFi =  "iPad Air 2 (WiFi)"
    
    /// iPad Air 2 (Cellular)
    case iPadAir2Cellular = "iPad Air 2 (Cellular)"
    
    /// iPad Pro 9.7
    case iPadPro9_7       = "iPad Pro 9.7\""
    
    /// iPad Pro 9.7 cellular
    case iPadPro9_7_cell  = "iPad Pro 9.7\" cellular"
    
    /// iPad Pro 10.5
    case iPadPro10_5      = "iPad Pro 10.5\""
    
    /// iPad Pro 10.5 cellular
    case iPadPro10_5_cell = "iPad Pro 10.5\" cellular"
    
    /// iPad Pro 12.9
    case iPadPro12_9      = "iPad Pro 12.9\""
    
    /// iPad Pro 12.9 cellular
    case iPadPro12_9_cell = "iPad Pro 12.9\" cellular"
    
    /// iPhone 6
    case iPhone6          = "iPhone 6"
    
    /// iPhone 6 Plus
    case iPhone6plus      = "iPhone 6 Plus"
    
    /// iPhone 6S
    case iPhone6S         = "iPhone 6S"
    
    /// iPhone 6S Plus
    case iPhone6Splus     = "iPhone 6S Plus"
    
    /// iPhone SE
    case iPhoneSE         = "iPhone SE"
    
    /// iPhone 7
    case iPhone7          = "iPhone 7"
    
    /// iPhone 7 Plus
    case iPhone7plus      = "iPhone 7 Plus"
    
    /// iPhone 8
    case iPhone8          = "iPhone 8"
    
    /// iPhone 8 Plus
    case iPhone8plus      = "iPhone 8 Plus"
    
    /// iPhone X
    case iPhoneX          = "iPhone X"
    
    /// iPhone X GSM
    case iPhoneXGSM = "iPhone X GSM"
    
    /// iPhone XS
    case iPhoneXS = "iPhone XS"
    
    /// iPhone XS Max
    case iPhoneXSMax = "iPhone XS Max"
    
    /// iPhone XS Max China
    case iPhoneXSMaxChina = "iPhone XS Max China"
    
    /// iPhone XR
    case iPhoneXR = "iPhone XR"
    
    /// unrecognized
    case unrecognized     = "?unrecognized?"
}

public extension UIDevice {
    
    /// Current model name
    public var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        var modelMap : [ String : Model ] = [
            "i386"       : .simulator,
            "x86_64"     : .simulator,
            "iPod1,1"    : .iPod1,
            "iPod2,1"    : .iPod2,
            "iPod3,1"    : .iPod3,
            "iPod4,1"    : .iPod4,
            "iPod5,1"    : .iPod5,
            "iPad2,1"    : .iPad2,
            "iPad2,2"    : .iPad2,
            "iPad2,3"    : .iPad2,
            "iPad2,4"    : .iPad2,
            "iPad2,5"    : .iPadMini1,
            "iPad2,6"    : .iPadMini1,
            "iPad2,7"    : .iPadMini1,
            "iPhone3,1"  : .iPhone4,
            "iPhone3,2"  : .iPhone4,
            "iPhone3,3"  : .iPhone4,
            "iPhone4,1"  : .iPhone4S,
            "iPhone5,1"  : .iPhone5,
            "iPhone5,2"  : .iPhone5,
            "iPhone5,3"  : .iPhone5C,
            "iPhone5,4"  : .iPhone5C,
            "iPad3,1"    : .iPad3,
            "iPad3,2"    : .iPad3,
            "iPad3,3"    : .iPad3,
            "iPad3,4"    : .iPad4,
            "iPad3,5"    : .iPad4,
            "iPad3,6"    : .iPad4,
            "iPhone6,1"  : .iPhone5S,
            "iPhone6,2"  : .iPhone5S,
            "iPad4,1"    : .iPadAir1,
            "iPad4,2"    : .iPadAir2,
            "iPad4,4"    : .iPadMini2,
            "iPad4,5"    : .iPadMini2,
            "iPad4,6"    : .iPadMini2,
            "iPad4,7"    : .iPadMini3,
            "iPad4,8"    : .iPadMini3,
            "iPad4,9"    : .iPadMini3,
            "iPad5,1"    : .iPadmini4WiFi,
            "iPad5,2"    : .iPadmini4thGenWiFiCellular,
            "iPad5,3"    : .iPadAir2WiFi,
            "iPad5,4"    : .iPadAir2Cellular,
            "iPad6,3"    : .iPadPro9_7,
            "iPad6,11"   : .iPadPro9_7,
            "iPad6,4"    : .iPadPro9_7_cell,
            "iPad6,12"   : .iPadPro9_7_cell,
            "iPad6,7"    : .iPadPro12_9,
            "iPad6,8"    : .iPadPro12_9_cell,
            "iPad7,3"    : .iPadPro10_5,
            "iPad7,4"    : .iPadPro10_5_cell,
            "iPhone7,1"  : .iPhone6plus,
            "iPhone7,2"  : .iPhone6,
            "iPhone8,1"  : .iPhone6S,
            "iPhone8,2"  : .iPhone6Splus,
            "iPhone8,4"  : .iPhoneSE,
            "iPhone9,1"  : .iPhone7,
            "iPhone9,2"  : .iPhone7plus,
            "iPhone9,3"  : .iPhone7,
            "iPhone9,4"  : .iPhone7plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,2" : .iPhone8plus,
            "iPhone10,3" : .iPhoneX,
            "iPhone10,6" : .iPhoneXGSM,
            "iPhone11,2" : .iPhoneXS,
            "iPhone11,4" : .iPhoneXSMax,
            "iPhone11,6" : .iPhoneXSMaxChina,
            "iPhone11,8" : .iPhoneXR
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            return model
        }
        return Model.unrecognized
    }
    
    /// Compare major system version i'e, iOS 10 == iOS 10
    public func systemVersionEquals(to version: String) -> Bool {
        let currentMajorOS = UIDevice.current.systemVersion.split(separator: ".").first ?? ""
        return currentMajorOS == version
    }
}
