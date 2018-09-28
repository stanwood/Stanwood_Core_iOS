//
//  AwesomeDisplayItems.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation


class AwesomeDisplayItems: Stanwood.Elements<AwesomeDisplayItem> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return DetailCell.self
    }
}
