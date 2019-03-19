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
        
        let floats: [Item] = [
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.clear", value: "0.0"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.veryLight", value: "0.3"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.light", value: "0.4"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.half", value: "0.5"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.faded", value: "0.7"),
            Item(title: "CGFloat", subTitle: "Alpha", signature: "CGFloat.Alpha.full", value: "1.0"),
            
            Item(title: "CGFloat", subTitle: "Damping", signature: "CGFloat.Damping.low", value: "0.3"),
            Item(title: "CGFloat", subTitle: "Damping", signature: "CGFloat.Damping.medium", value: "0.7"),
            Item(title: "CGFloat", subTitle: "Damping", signature: "CGFloat.Damping.high", value: "1.0"),
            
            Item(title: "CGFloat", subTitle: "Spring", signature: "CGFloat.Spring.clear", value: "0.3"),
            Item(title: "CGFloat", subTitle: "Spring", signature: "CGFloat.Spring.veryLight", value: "0.7"),
            Item(title: "CGFloat", subTitle: "Spring", signature: "CGFloat.Spring.light", value: "1.0"),
            
            Item(title: "CGFloat", subTitle: "Radius", signature: "CGFloat.Radius.tiny", value: "5"),
            Item(title: "CGFloat", subTitle: "Radius", signature: "CGFloat.Radius.small", value: "8"),
            Item(title: "CGFloat", subTitle: "Radius", signature: "`CGFloat.Radius.medium`", value: "15"),
            Item(title: "CGFloat", subTitle: "Radius", signature: "`CGFloat.Radius.large`", value: "20")
        ]
        
        let strings: [Item] = [
            Item(title: "String", subTitle: "String", signature: "\"MY_LOCAL_STRING\".localized", value: "Some Pretty string"),
            Item(title: "String", subTitle: "String", signature: "\"Some Pretty string\".first", value: "Some Pretty string".first),
            Item(title: "String", subTitle: "String", signature: "\"Some Pretty string\".last", value: "Some Pretty string".last),
            Item(title: "String", subTitle: "String", signature: "\"www.here.com\".httpURLString", value: "www.here.com".httpURLString),
            Item(title: "String", subTitle: "String", signature: "\"07976876560\".phoneFormat", value: "07976876560".phoneFormat),
            Item(title: "String", subTitle: "String", signature: "\"myNiceNameHere\".snakeCased()", value: "myNiceNameHere".snakeCased()),
        ]
        
        let intervals: [Item] = [
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.instant", value: "0.0"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.superSmall", value: "0.001"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.halfTiny", value: "0.05"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.tiny", value: "0.1"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.quick", value: "0.2"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.normal", value: "0.3"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.middle", value: "0.4"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.medium", value: "0.5"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.mediumSlow", value: "0.7"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.instant", value: "0.8"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.slow", value: "1.0"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.long", value: "2.0"),
            Item(title: "TimeInterval", subTitle: "TimeInterval", signature: "TimeInterval.wait", value: "3.0")
        ]
        
        let allFloats = MainItem(title: "CGFloat", items: floats)
        let allStrings = MainItem(title: "String", items: strings)
        let allIntervals = MainItem(title: "TimeInterval", items: intervals)


//        let item2 = MainItem(title: "Three", items: itemsTwo)
//        let item3 = MainItem(title: "Three", items: itemsThree)
        
        let allItems = MainItems(items: [allFloats, allStrings, allIntervals])
        
        
        configureTableView(sections: allItems)
        
        UIApplication.shared.setUserAgent(env: UIApplication.Env.debug)
        
    }
    
    
    func configureTableView(sections: MainItems) {
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.addSubview(tableView)
        
        tableView.register(cellType: TableViewCell.self)
        
        delegate = TableDelegate(dataType: sections)
        dataSource = TableDataSource(dataType: sections, delegate: self)
        
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        
    }
}


struct MainItem: Typeable, Codable {
    
    var title: String?
    var items: [Item]?
}

class MainItems: Stanwood.Elements<MainItem> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return TableViewCell.self
            
    }
}


