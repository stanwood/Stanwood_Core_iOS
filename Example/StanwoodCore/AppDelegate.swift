//
//  AppDelegate.swift
//  StanwoodCore
//
//  Created by Tal Zion on 10/09/2017.
//  Copyright (c) 2017 Tal Zion. All rights reserved.
//

import UIKit
import StanwoodCore
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var listener: UITestingCoreListener!
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        listen()
        
        return true
    }
    
    private func listen() {
        listener = UITestingCoreListener()
        listener.listen { (item) in
            
            let dataBase = Database.database()
            var ref = dataBase.reference()
            ref = ref.child("uitesting_hierarchy")
            
            if let payload = item.payload() {
                ref.setValue(payload)
            }
        }
    }
}

