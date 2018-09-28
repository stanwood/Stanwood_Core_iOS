//
//  DisplayContentCell.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

class DisplayContentCell: Stanwood.AutoSizeableCell, Fillable {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func fill(with type: Type?) {
        
        guard let item = type as? FunkyObject else { return }
    
        titleLabel.text = item.title
        
        supportIOS12SelfSizing()
    }
}
