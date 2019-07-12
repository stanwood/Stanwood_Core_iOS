//
//  Object.swift
//  StanwoodCore_Tests
//
//  Created by Tal Zion on 03/01/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import StanwoodCore

struct Item: Typeable, Codable {
    
    var title: String?
    var subTitle: String?
    var signature: String?
    var value: String?
}

//struct MainItem: Typeable, Codable {
//    
//    var title: String?
//    var items: [Item]?
//}


class MainItem: Stanwood.Elements<Item> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return DetailTableViewCell.self
        
    }
}

