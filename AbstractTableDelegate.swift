//
//  AbstractTableDelegate.swift
//  Schneehoehen
//
//  Created by Tal Zion on 19/07/2017.
//  Copyright © 2017 Stanwood. All rights reserved.
//

import UIKit

protocol TableDelegate {
    
    var dataObject:DataType? { get set }
    var dataType:Type?{ get set }
    
    func update(with dataObject: DataType?)
    func update(with dataType: Type?)
}

extension Stanwood {
    
    public class AbstractTableDelegate: NSObject, UITableViewDelegate, TableDelegate {
        
        public internal(set) var dataObject:DataType?
        public internal(set) var dataType: Type?
        
        public init(dataObject: DataType?) {
            self.dataObject = dataObject
        }
        
        public init(dataType: Type) {
            self.dataType = dataType
        }
        
        open func update(with dataObject: DataType?) {
            self.dataObject = dataObject
        }
        
        open func update(with dataType: Type?) {
            self.dataType = dataType
        }
        
    }
}
