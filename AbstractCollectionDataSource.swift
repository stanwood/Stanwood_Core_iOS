//
//  AbstractCollectionDataSource.swift
//  Schneehoehen
//
//  Created by Tal Zion on 19/07/2017.
//  Copyright © 2017 Stanwood. All rights reserved.
//

import UIKit

protocol CollectionDataSource: class {
    
    var dataObject:DataType? { get set }
    var dataType: Type? { get set }
    weak var target:UIViewController? {get set}
    
    func update(with dataObject: DataType)

    func numberOfSections(in collectionView: UICollectionView) -> Int
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    
    func setEmptyScreen(visible: Bool, from collectionView: UICollectionView)
}

class AbstractCollectionDataSource: NSObject, UICollectionViewDataSource, CollectionDataSource {


    var dataObject:DataType?
    var dataType: Type?
    
    weak var target: UIViewController?

    
    init(dataObject: DataType?, target: UIViewController? = nil) {
        self.target = target
        self.dataObject = dataObject
    }
    
    init(type: Type, target: UIViewController? = nil) {
        self.target = target
        self.dataType = type
    }
    
    func update(with dataObject: DataType) {
        self.dataObject = dataObject
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch (dataObject, dataType) {
        case (.some, .none):
            return dataObject?.numberOfSections ?? 0
        case (.none, .some):
            return 1
        case (.some, .some):
            fatalError("\(String(describing: type(of: self))) should not have dataType and dataObject at the same time.")
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataObject?[section].numberOfItems ?? (dataType == nil ? 0 : 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: IndexPath) {
        fatalError("Must override DataSource didEndDisplayingCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        fatalError("Must overide DataSource cellForItemAtIndexPath")
    }
    
    /// Overide this to present or dismiss `NoContentView`
    func setEmptyScreen(visible: Bool, from collectionView: UICollectionView) {}
}
