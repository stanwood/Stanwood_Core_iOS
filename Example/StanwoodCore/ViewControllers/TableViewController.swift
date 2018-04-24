//
//  TableViewController.swift
//  StanwoodCore_Example
//
//  Created by Tal Zion on 28/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import StanwoodCore

class TableViewController: UIViewController {
    
    var tableView: UITableView!
    
    var delegate: TableDelegate!
    var dataSource: Stanwood.AbstractTableDataSource!
    var elements: Stanwood.Elements<Deal>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items: [Deal] = [
            Deal(id: "TEST_TITLE1"),
            Deal(id: "TEST_TITLE2"),
            Deal(id: "TEST_TITLE3"),
            Deal(id: "TEST_TITLE4"),
        ]
        
        configureTableView(items: items)
    }
    
    func configureTableView(items: [Deal]) {
        
        elements = Tables(items: items)
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        
        tableView.register(cellType: TableViewCell.self)
        
        delegate = TableDelegate(dataObject: elements)
        dataSource = Stanwood.AbstractTableDataSource(dataObject: elements)
        
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
    }
}
