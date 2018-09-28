//
//  AppController.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/27/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation
import UIKit

class AppController {
    
    let appData = AppData()
    let dataProvider: DataProvider
    let window: UIWindow
    
    let coordinator: Coordinator
    let actions: Actions
    let parameters: Parameters
    
    init(with window: UIWindow) {
        
        self.window = window
        
        dataProvider = DataProvider(appData: appData, networkManager: NetworkManager())
        
        parameters = Parameters(appData: appData)
        coordinator = Coordinator(window: window)
        
        actions = Actions(appData: appData, dataProvider: dataProvider, coordinator: coordinator)
        coordinator.actions = actions
        coordinator.parameters = parameters
        
        Configurations.configureFirebase()
        Configurations.configureStore()
        
        coordinator.loadInitialController()
        
        fetchAppData()
    }
    
    func fetchAppData(){
        
    }
}


// MARK:- AppDelegate Delegates


extension AppController {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return true
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        completionHandler(.noData)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {

    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func loadRatingDialog() {
        
    }
}


// MARK:- Static Functions


extension AppController {
    
    static func regististerForRemoteNotifications(){
        
    }
}
