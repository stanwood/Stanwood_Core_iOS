//
//  ViewController.swift
//  StanwoodCore
//
//  Created by Tal Zion on 10/09/2017.
//  Copyright (c) 2017 Tal Zion. All rights reserved.
//

import UIKit
import StanwoodCore

class Tables: Stanwood.Elements<Item> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return TableViewCell.self
    }
}

class Collections: Stanwood.Elements<Item> {
    
    override func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
        return DetailTableViewCell.self
    }
}

class CoreExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIBarButtonItem()
        button.localizedTitle = "TEST_TITLE"
    }
}


