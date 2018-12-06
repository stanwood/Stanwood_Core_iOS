//
//  ViewAnimationBundle.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 16/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import  UIKit

enum TransitionType{
    case fade
    case opaque
}

// Contains all objects needed to animate one view to the next

struct ViewAnimationBundle {
    var animatingView: UIView!
    var orignalView: UIView!
    var destinationView: UIView!
    var destinationViewCopy: UIView!
    var newFrame: CGRect!
    var originalFrame: CGRect!
    var transitionType: TransitionType = .opaque
    var index = 0
}
