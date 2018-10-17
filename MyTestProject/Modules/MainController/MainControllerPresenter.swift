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
    
    unowned var viewable: MainControllerViewable
    var actionable: MainControllerActionable
    var parameterable: MainControllerParameterable
    
    // MARK:- Typealias
    
    typealias Actionable = MainControllerActionable
    typealias Parameterable = MainControllerParameterable
    typealias Viewable = MainControllerViewable
    
    
    required init(actionable: MainControllerActionable, parameterable: MainControllerParameterable, viewable: MainControllerViewable) {
        self.viewable = viewable
        self.actionable = actionable
        self.parameterable = parameterable
    }
    
    func viewDidLoad() {
    
    }
    
}
