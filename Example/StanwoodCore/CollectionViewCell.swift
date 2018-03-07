//
//  CollectionViewCell.swift
//  StanwoodCore_Example
//
//  Created by Tal Zion on 12/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import StanwoodCore

class CollectionViewCell: Stanwood.AutoSizeableCell, Fillable {

    @IBOutlet weak var label: UILabel!
    
    override func prepare() {
        label.text = nil
    }
    
    func fill(with type: Type?) {
        guard let item = type as? Object else { return }
        label.localizedText = item.id
    }
}
