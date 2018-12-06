//
//  Date+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

extension Date {
    
    static func dateFormatter(with format: String = "yyyy-MM-dd'T'HH:mm:ssZZZZZ") -> DateFormatter {
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateFormat = format
        
        return formatter
    }
    public func dateString(from format: String? = "dd.MM.yyyy") -> String{
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    var isInThePast: Bool{
        return self.timeIntervalSinceNow.sign == .minus
    }
    
    var isToday: Bool{
        return Calendar.current.isDate( Date(), inSameDayAs: self)
    }
    
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}
