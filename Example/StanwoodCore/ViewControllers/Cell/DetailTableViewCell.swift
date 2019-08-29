//
//  DetailTableViewCell.swift
//  StanwoodCore_Example
//
//  Created by Aaron Tredrea on 15/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import StanwoodCore
import SourceModel

class DetailTableViewCell: UITableViewCell, Fillable  {
    
    @IBOutlet weak var sigLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var backLeadingConstraint: NSLayoutConstraint!
    
    var item: Item?
    
    func fill(with type: Model?) {
        
        guard let item = type as? Item else { return }
        
        self.item = item
        
        sigLabel.text = item.signature
        valueLabel.text = item.value
        typeLabel.text = item.subTitle
    }
    
    @IBAction func didSelectCell(_ sender: Any) {
        
        guard let type = CodeType(rawValue: (item?.subTitle ?? "").lowercased()) else { return }
        
        var alpha: CGFloat = 1
        var damping: CGFloat = 1
        var spring: CGFloat = 1
        var radius: CGFloat = 0
        var constraintConstant: CGFloat = 0
        var duration: Double = .medium

        
        switch type {
        case .alpha:
            alpha = item?.value?.floatValue ?? 1
            constraintConstant = self.frame.width / 2
        case.damping:
            damping = item?.value?.floatValue ?? 1
            constraintConstant = self.frame.width / 2
        case.spring:
            spring = item?.value?.floatValue ?? 1
            constraintConstant = self.frame.width / 2
        case.radius:
            radius = item?.value?.floatValue ?? 1
            constraintConstant = self.frame.width / 2
        case .timeinterval:
            duration = item?.value?.doubleValue ?? 1
            constraintConstant = self.frame.width / 2
        }
        
        UIView.animate(withDuration: duration, delay: .instant, usingSpringWithDamping: damping, initialSpringVelocity: spring, options: .allowAnimatedContent, animations: {
           
            self.backView.alpha = alpha
            self.backView.layer.cornerRadius = radius
            self.backLeadingConstraint.constant = constraintConstant
            self.layoutIfNeeded()
            
        }, completion: {  (done) in
            
            UIView.animate(withDuration: duration, delay: .wait, options: .allowAnimatedContent, animations: {
                
                self.backView.alpha = 1
                self.backView.layer.cornerRadius = 0
                self.backLeadingConstraint.constant = 0
                self.layoutIfNeeded()
                
            }, completion: { (_) in
                //self?.didSelectCell(self)
            })
        })
    }
}

enum CodeType: String {
    case alpha
    case damping
    case spring
    case radius
    case timeinterval
}


extension String {
    
    var floatValue: CGFloat {
        
        guard
            let number = NumberFormatter().number(from: self)
            else { return 0 }
        
        return CGFloat(truncating: number)
    }
    
    var doubleValue: Double {
        
        guard
            let number = NumberFormatter().number(from: self)
            else { return 0 }
        
        return Double(truncating: number)
    }
}
