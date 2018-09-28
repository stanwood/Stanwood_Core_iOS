//
//  AppDelegate.swift
//  GLAMOUR
//
//  Created by Aaron Tredrea on 25/05/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit
import UserNotificationsUI
import UserNotifications


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appController: AppController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

            window = UIWindow(frame: UIScreen.main.bounds)
            appController = AppController(with: window!)
    
            window?.makeKeyAndVisible()
    
            return true
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        appController?.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        appController?.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appController?.application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
       return appController?.application(application, continue: userActivity, restorationHandler: restorationHandler) ?? true
    }
    
    private func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return appController?.application(app, open: url, options: options) ?? false
    }
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        appController?.application(application, performFetchWithCompletionHandler: completionHandler)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appController?.applicationDidBecomeActive(application)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        appController?.applicationWillEnterForeground(application)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        appController?.applicationDidEnterBackground(application)
    }
}

