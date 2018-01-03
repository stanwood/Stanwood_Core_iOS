//
//  FeedbackGenerator.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension Stanwood {
    
    /**
     Vibration generator to provide user with feedback.
     
     - Since: Avalible in iOS 10.*
     */
    @available(iOS 10.0, *)
    open class FeedbackGenerator {
        
        private init () {}
        
        /**
         Generates a feebdack impact vibration style
         
         - Parameter:
            - style: add `UIImpactFeedbackStyle` vibration style
         
         - SeeAlso:
         
         [`UIImpactFeedbackStyle`](https://developer.apple.com/documentation/uikit/uiimpactfeedbackstyle)
         
         [`UIImpactFeedbackGenerator`](https://developer.apple.com/documentation/uikit/UIImpactFeedbackGenerator)
         */
        public static func generate(style: UIImpactFeedbackStyle) {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.prepare()
            generator.impactOccurred()
        }
        
        /**
         Generates a feebdack notification vibration feedback
         
         - Parameter:
            - feedback: add `UINotificationFeedbackType` vibration feedback
         
         - SeeAlso:
         
         [`UINotificationFeedbackType`](https://developer.apple.com/documentation/uikit/UINotificationFeedbackType)
         
         [`UINotificationFeedbackGenerator`](https://developer.apple.com/documentation/uikit/UINotificationFeedbackGenerator)
         */
        public static func generate(feedback: UINotificationFeedbackType) {
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(feedback)
        }
    }
    
}
