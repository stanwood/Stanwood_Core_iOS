//
//  Actions.swift
//  MyTestProject
//
//  Created by Aaron Mc Tieguy on 10/16/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

protocol Actionable {
    var appData: AppData { get }
    var dataProvider: DataProvider { get }
    var coordinator: Coordinator { get }
    var parameters: Parameters { get }
}

class Actions: Actionable {
    
    let appData: AppData
    let dataProvider: DataProvider
    let coordinator: Coordinator
    let parameters: Parameters
    
    init(appData: AppData, dataProvider: DataProvider, coordinator: Coordinator, parameters: Parameters) {
        self.appData = appData
        self.dataProvider = dataProvider
        self.coordinator = coordinator
        self.parameters = parameters
    }
    
    func fetchRemoteConfig() {
        Configurations.fetchRemoteConfig()
    }
}
