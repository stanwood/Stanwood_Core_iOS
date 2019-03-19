//
//  DetailTableViewController.swift
//  StanwoodCore_Example
//
//  Created by Aaron Tredrea on 15/03/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {

    
    var deals = [Item]()
    
    var sections: [[Item]] {
        return deals.asSections
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(cellType: DetailTableViewCell.self)
        navigationItem.title = deals.first?.title
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = Header.loadFromNib()
        header?.titleLabel.text = sections[section].first?.subTitle
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as! DetailTableViewCell
        
        let section = sections[indexPath.section]

        let deal = section[indexPath.row]
        
        cell.fill(with: deal)
        return cell
    }
}

extension Array where Element == Item {
    
    var asSections: [[Item]] {
        
        var result = [[Item]]()
        
        for item in self {
            
            let existingIndex = result.firstIndex(where: { $0.first?.subTitle == item.subTitle })
            
            if let index = existingIndex {
                result[index].append(item)
            }else{
                result.append( [item])
            }
        }
        
        return result
    }
}
