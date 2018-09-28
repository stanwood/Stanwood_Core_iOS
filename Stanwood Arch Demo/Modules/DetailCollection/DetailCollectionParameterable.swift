//
//  DetailCollectionParameterable.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

/// Remove and add with snippets This is the subclass example
protocol DetailCollectionParameterable {
    var items: AwesomeDisplayItems { get set }
}

class DetailParameters: Parameters, DetailCollectionParameterable {
    
    var items: AwesomeDisplayItems
    
    init(with items: AwesomeDisplayItems, appData: AppData){
        self.items = items
        super.init(appData: appData)
    }
}
