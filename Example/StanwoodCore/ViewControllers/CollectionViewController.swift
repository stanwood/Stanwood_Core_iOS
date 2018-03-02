//
//  CollectionViewController.swift
//  StanwoodCore_Example
//
//  Created by Tal Zion on 28/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import StanwoodCore

class CollectionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var delegate: Stanwood.AbstractCollectionDelegate!
    var dataSource: Stanwood.AbstractCollectionDataSource!
    var elements: Stanwood.Elements<Object>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items: [Object] = [
            Object(id: "TEST_TITLE1"),
            Object(id: "TEST_TITLE2"),
            Object(id: "TEST_TITLE3"),
        ]
        
        configureCollectionView(items: items)
    }
    
    func configureCollectionView(items: [Object]) {
        
        elements = Collections(items: items)
        
        let layoyt = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layoyt)
        
        view.addSubview(collectionView)
        collectionView.register(cellType: CollectionViewCell.self)
        collectionView.setAutomaticSize()
        collectionView.set(spacing: 5)
        delegate = Stanwood.AbstractCollectionDelegate(dataObject: elements)
        dataSource = Stanwood.AbstractCollectionDataSource(dataObject: elements)
        
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
    }
}
