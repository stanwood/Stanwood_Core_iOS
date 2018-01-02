//
//  AbstractTableDataSource.swift
//  Schneehoehen
//
//  Created by Tal Zion on 19/07/2017.
//  Copyright © 2017 Stanwood. All rights reserved.
//

import UIKit

protocol TableDataSource {
    
    var dataObject:DataType? {get set}
    var dataType: Type? { get set }
    
    func update(with dataObject: DataType?)
    func update(with dataType: Type?)
    
    func numberOfSections(in tableView: UITableView) -> Int
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

extension Stanwood {
    
    public class AbstractTableDataSource: NSObject, UITableViewDataSource, TableDataSource {
        
        public internal(set) var dataObject:DataType?
        public internal(set) var dataType: Type?
        
        public init(dataObject: DataType) {
            self.dataObject = dataObject
        }
        
        public init(dataType: Type) {
            self.dataType = dataType
        }
        
        open func update(with dataObject: DataType?) {
            self.dataObject = dataObject
        }
        
        open func update(with dataType: Type?) {
            self.dataType = dataType
        }
        
        public func numberOfSections(in tableView: UITableView) -> Int {
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
        
        public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            fatalError("Must override DataSource cellForItemAtIndexPath")
        }
    }
}
