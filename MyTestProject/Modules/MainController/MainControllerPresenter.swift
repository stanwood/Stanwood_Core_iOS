//
//  MainControllerPresenter.swift
//  MyTestProject
//
//  Created by AT on 10/16/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

protocol MainControllerViewable: class {
    
}

class MainControllerPresenter: Presentable {
    
    // MARK:- Properties
    
    weak var view: MainControllerViewable?
    var actions: MainControllerActionable
    var parameters: MainControllerParameterable
    
    // MARK:- Typealias
    
    typealias Actionable = MainControllerActionable
    typealias Parameterable = MainControllerParameterable
    typealias Viewable = MainControllerViewable
    
    required init(actions: MainControllerActionable, parameters: MainControllerParameterable, view: MainControllerViewable) {
        self.actions = actions
        self.view = view
        self.parameters = parameters
    }
    
    func viewDidLoad() {
        
    }
    
}
