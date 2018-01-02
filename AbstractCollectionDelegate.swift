//
//  AbstractCollectionDelegate.swift
//  Schneehoehen
//
//  Created by Tal Zion on 19/07/2017.
//  Copyright © 2017 Stanwood. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionDelegate {
    
    var dataObject: DataType? { get set }
    var dataType: Type? { get set }
    
    func update(with dataObject: DataType?)
    func update(with dataType: Type?)
}

extension Stanwood {
    
    public class AbstractCollectionDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CollectionDelegate {
        
        public internal(set) var dataObject:DataType?
        public internal(set) var dataType: Type?
        
        init(dataObject: DataType) {
            self.dataObject = dataObject
        }
        
        init(dataType: Type) {
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
