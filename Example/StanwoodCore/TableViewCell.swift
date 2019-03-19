//
//  TableViewCell.swift
//  StanwoodCore_Example
//
//  Created by Tal Zion on 27/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import StanwoodCore


class TableViewCell: UITableViewCell, Fillable, Delegateble {
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func fill(with type: Type?) {
        
        accessoryType = .none
        
        guard let item = type as? MainItem else { return }
        
        titleLabel.text = item.title
    }
    
    func set(delegate: AnyObject) {
        
    }
}




