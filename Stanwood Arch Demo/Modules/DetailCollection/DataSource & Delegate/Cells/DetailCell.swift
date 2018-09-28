//
//  DetailCell.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

protocol DetailCellDelegatge: class {
    func didSelectButton()
}

class DetailCell: Stanwood.AutoSizeableCell, Fillable, Delegateble {
    /// Remove and add with snippets
    @IBOutlet weak var titleLabel: UILabel!
    
    weak var delegate: DetailCellDelegatge?
    
    func set(delegate: AnyObject) {
        self.delegate = delegate as? DetailCellDelegatge
    }
    
    func fill(with type: Type?) {
        
        guard let item = type as? AwesomeDisplayItem else {
            
            titleLabel.text = "Something is broken :( #5minutefix"
            return
        }
        
        titleLabel.text = item.title
        
        supportIOS12SelfSizing()
    }
    
    @IBAction func testAction(_ sender: UIButton) {
        delegate?.didSelectButton()
    }
}
