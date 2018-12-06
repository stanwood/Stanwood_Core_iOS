//
//  Regex.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


struct Regex {
    static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    static let name = "^(?=.{1,40}$)[a-zA-Z]+(?:[a-zA-Z]+)*$"
}


extension NSRegularExpression {
    
    func isValid(for string: String) -> Bool {
        return firstMatch(in: string, options: [], range: string.range) != nil
    }
}

enum RegexType{
    case email, name // TODO:- Password
}

extension String {
    
    func isValid(_ type: RegexType) -> Bool{
        
        switch type {
        case .email:
            return Regex.email.regularExpression?.isValid(for: self) ?? false
        case .name:
            return !(Regex.name.regularExpression?.isValid(for: self) ?? true) && isTwoOrMoreWords
        }
    }
    
    var isTwoOrMoreWords: Bool {
        
        let words = components(separatedBy:" ")
        
        guard
            words.count > 1,
            words[1].count > 0
            else{
                return false
        }
        
        return true
    }
    
    var regularExpression: NSRegularExpression? {
        return try? NSRegularExpression(pattern: self, options: .caseInsensitive)
    }
}
