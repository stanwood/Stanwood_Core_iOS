//
//  FunkyObjects.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

class FunkyObjects: Stanwood.Elements<FunkyObject> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return DisplayContentCell.self
    }
}
