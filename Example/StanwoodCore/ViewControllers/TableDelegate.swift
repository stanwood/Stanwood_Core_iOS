//
//  TableDataSource.swift
//  StanwoodCore_Example
//
//  Created by Tal Zion on 28/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import StanwoodCore
import SourceModel

class TableDelegate: SourceModel.TableDelegate {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = Header.loadFromNib()
        let path = IndexPath(item: 0, section: section)

        header?.titleLabel.text = (modelCollection?[path] as? Item)?.title
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
