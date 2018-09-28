//
//  Actions.swift
//  GLAMOUR
//
//  Created by Aaron Tredrea on 25/05/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

class Actions {
    
    
    // MARK:- Properties

    
    let appData: AppData
    let dataProvider: DataProvider
    let coordinator: Coordinator
    var shopsRequest: URLSessionDataTask?


    // MARK:- Initialisers

    
    init(appData: AppData, dataProvider: DataProvider, coordinator: Coordinator) {
        self.appData = appData
        self.dataProvider = dataProvider
        self.coordinator = coordinator
    }
    
    
    // MARK:- Functions (Functions that are not module specific and accesable globally)

    
    func logUserOut(){
     
    }
    
}
