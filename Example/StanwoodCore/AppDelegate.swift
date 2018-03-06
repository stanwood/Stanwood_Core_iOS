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

#if DEBUG
    import StanwoodUITestingCore
#endif

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    #if DEBUG
    var listener: UITestingCoreListener!
    #endif
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        #if DEBUG
            listen()
        #endif
        return true
    }
    
    #if DEBUG
    private func listen() {
        
        listener = UITestingCoreListener()
        Auth.auth().signInAnonymously { (user, error) in
            
            DispatchQueue.global(qos: .background).async {
                
                // Listening to view events
                self.listener.listen { (item) in
                    
                    // Setting a Database instance
                    let dataBase = Database.database()
                    var ref = dataBase.reference()
                    ref = ref.child("uitesting_hierarchy_ios")
                    
                    // Observing previous core versions
                    ref.observeSingleEvent(of: .value, with: { (snapshot) in
                        
                        // Checking if the version exists
                        guard let value = snapshot.value as? [String: Any],
                            let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)  else {
                                let currentItems = UITestingCoreItems(versions: [item])
                                if let payload = currentItems.payload() {
                                    ref.setValue(payload)
                                }
                                return
                        }
                        
                        // Updating the current version
                        if var currentItems = try? JSONDecoder().decode(UITestingCoreItems.self, from: data) {
                            currentItems.append(item)
                            
                            if let payload = currentItems.payload() {
                                ref.setValue(payload)
                            }
                        }
                    })
                    
                }
            }
        }
    }
    #endif
}
