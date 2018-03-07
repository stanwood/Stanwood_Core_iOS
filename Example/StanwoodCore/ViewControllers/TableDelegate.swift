//
//  TableDataSource.swift
//  StanwoodCore_Example
//
//  Created by Tal Zion on 28/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import StanwoodCore

class TableDelegate: Stanwood.AbstractTableDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiate(viewController: CollectionViewController.self)
        UIApplication.presentedViewController?.navigationController?.pushViewController(viewController, animated: true)
    }
}
