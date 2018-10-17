//
//  DataProvider.swift
//  MyTestProject
//
//  Created by Aaron Mc Tieguy on 10/16/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

class DataProvider {
    
    private let appData: AppData
    private let networkManager: Networking
    
    init(appData: AppData, networkManager: Networking) {
        self.appData = appData
        self.networkManager = networkManager
    }
    
}
