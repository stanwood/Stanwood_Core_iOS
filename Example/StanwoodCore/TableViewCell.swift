//
//  TableViewCell.swift
//  StanwoodCore_Example
//
//  Created by Tal Zion on 27/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import StanwoodCore

class TableViewCell: UITableViewCell, Fillable {

    @IBOutlet weak var label: UILabel!

    func fill(with type: Type?) {
        guard let item = type as? Deal else { return }
        label.localizedText = item.id
    }
}
