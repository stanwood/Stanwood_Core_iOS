//
//  ViewController.swift
//  StanwoodCore
//
//  Created by Tal Zion on 10/09/2017.
//  Copyright (c) 2017 Tal Zion. All rights reserved.
//

import UIKit
import StanwoodCore

extension UILabel {
    
}

class Tables: Stanwood.Elements<Object> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return TableViewCell.self
    }
}

class Collections: Stanwood.Elements<Object> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return CollectionViewCell.self
    }
}


class CoreExampleViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var tableView: UITableView!
    
    var delegate: Stanwood.AbstractCollectionDelegate!
    var dataSource: Stanwood.AbstractCollectionDataSource!
    
    var tableDelegate: Stanwood.AbstractTableDelegate!
    var tableDataSource: Stanwood.AbstractTableDataSource!
    
    var elements: Stanwood.Elements<Object>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items: [Object] = [
            Object(id: "TEST_TITLE1"),
            Object(id: "TEST_TITLE2"),
            Object(id: "TEST_TITLE3"),
            Object(id: "TEST_TITLE4"),
            Object(id: "TEST_TITLE5"),
            Object(id: "TEST_TITLE6"),
            Object(id: "TEST_TITLE7"),
            Object(id: "TEST_TITLE8"),
            Object(id: "TEST_TITLE9"),
            Object(id: "TEST_TITLE10"),
            Object(id: "TEST_TITLE11"),
            Object(id: "TEST_TITLE12"),
            Object(id: "TEST_TITLE13"),
            Object(id: "TEST_TITLE14")
        ]
        
        let button = UIBarButtonItem()
        button.localizedTitle = "TEST_TITLE"
        self.configureCollectionView(items: items)
        //        configureTableView(items: items)
    }
    
    func configureTableView(items: [Object]) {
        
        elements = Tables(items: items)
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        
        tableView.register(cellType: TableViewCell.self)
        
        tableDelegate = Stanwood.AbstractTableDelegate(dataObject: elements)
        tableDataSource = Stanwood.AbstractTableDataSource(dataObject: elements)
        
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        tableView.delegate = tableDelegate
        tableView.dataSource = tableDataSource
        
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


