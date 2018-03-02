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
        
        DispatchQueue.global(qos: .background).async {
            
            self.listener.listen { (item) in
                
                let dataBase = Database.database()
                var ref = dataBase.reference()
                ref = ref.child("uitesting_hierarchy")
                ref.observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    guard let value = snapshot.value as? [String: Any],
                        let data = try? JSONSerialization.data(withJSONObject: value, options: JSONSerialization.WritingOptions.prettyPrinted)  else {
                            let currentItems = UITestingCoreItems(versions: [item])
                            if let payload = currentItems.payload() {
                                ref.setValue(payload)
                            }
                            return
                    }
                    
                    do {
                        var currentItems = try JSONDecoder().decode(UITestingCoreItems.self, from: data)
                        currentItems.append(item)
                        
                        if let payload = currentItems.payload() {
                            ref.setValue(payload)
                        }
                    } catch {
                        print(error)
                    }
                    
                })
                
            }
        }
    }
}

