//
//  FeedbackGenerator.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension Stanwood {
    
    open class FeedbackGenerateor {
        
        private init () {}
        
        /**
         Generates a feebdack impact vibration style
         */
        public static func generate(styleType style: UIImpactFeedbackStyle) {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.prepare()
            generator.impactOccurred()
        }
        
        /**
         Generates a feebdack notification vibration style
         */
        public static func generate(feedbackType feedback: UINotificationFeedbackType) {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(feedback)
        }
    }
    
}
