//
//  Parameters.swift
//  MyTestProject
//
//  Created by Aaron Mc Tieguy on 10/16/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

protocol Parameterable {
    var appData: AppData { get }
}

class Parameters: Parameterable {
    
    let appData: AppData
    
    init(appData: AppData) {
        self.appData = appData
    }
}
