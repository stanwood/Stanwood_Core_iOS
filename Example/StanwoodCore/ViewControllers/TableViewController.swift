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
    var dataSource: TableDataSource!
    var sections: Stanwood.Sections!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let items: [Deal] = [
            Deal(id: "SECTION_1_TEST_TITLE_1"),
            Deal(id: "SECTION_1_TEST_TITLE_2"),
            Deal(id: "SECTION_1_TEST_TITLE_3"),
            Deal(id: "SECTION_1_TEST_TITLE_4"),
        ]
        
        let itemsTwo: [Deal] = [
            Deal(id: "SECTION_2_TEST_TITLE_1"),
            Deal(id: "SECTION_2_TEST_TITLE_2"),
            Deal(id: "SECTION_2_TEST_TITLE_3"),
            Deal(id: "SECTION_2_TEST_TITLE_4"),
            ]
        
        let itemsThree: [Deal] = [
            Deal(id: "SECTION_3_TEST_TITLE_1"),
            Deal(id: "SECTION_3_TEST_TITLE_2"),
            Deal(id: "SECTION_3_TEST_TITLE_3"),
            Deal(id: "SECTION_3_TEST_TITLE_4"),
            ]
        
        
        let sectionOne = Tables(items: items)
        let sectionTwo = Tables(items: itemsTwo)
        let sectionThree = Tables(items: itemsThree)
        
        configureTableView(sections: [sectionOne, sectionTwo, sectionThree])
        
        
        UIApplication.shared.setUserAgent(forProjectPrefix: "snh", env: UIApplication.Env.debug)
        
    }
    
    
    func configureTableView(sections: [Stanwood.Sections.Section]) {
        
        self.sections = Stanwood.Sections(items: sections)
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        
        tableView.register(cellType: TableViewCell.self)
        
        delegate = TableDelegate(dataType: self.sections)
        dataSource = TableDataSource(dataType: self.sections, delegate: self)
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
    }
}
