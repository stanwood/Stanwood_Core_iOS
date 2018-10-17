//
//  AppController.swift
//  MyTestProject
//
//  Created by Aaron Mc Tieguy on 10/16/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//


import Foundation
import UIKit

class AppController {
    
    private unowned var window: UIWindow
    private let networkManager: Networking
    private let dataProvider: DataProvider
    private let appData: AppData = AppData()
    private let coordinator: Coordinator
    private let actions: Actions
    private let parameters: Parameters
    
    init(with window: UIWindow) {
        
        self.window = window
        networkManager = NetworkManager()
        
        dataProvider = DataProvider(appData: appData, networkManager: networkManager)
        
        parameters = Parameters(appData: appData)
        coordinator = Coordinator(window: window)
        
        actions = Actions(appData: appData, dataProvider: dataProvider, coordinator: coordinator, parameters: parameters)
        coordinator.actions = actions
        coordinator.parameters = parameters
        
        configureRootView()
        fetchConfigurations()
    }
    
    private func fetchConfigurations() {
        actions.fetchRemoteConfig()
    }
    
    private func configureRootView() {
        coordinator.configureRootView()
    }
}
