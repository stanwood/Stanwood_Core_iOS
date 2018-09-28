//
//  DisplayControllerPresenter.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

protocol DisplayControllerViewable: class {
    
}

class DisplayControllerPresenter: Presentable {
    
    // MARK:- Properties
    
    unowned var viewable: DisplayControllerViewable
    var actionable: DisplayControllerActionable
    var parameterable: DisplayControllerParameterable

    // MARK:- Typealias
    
    typealias Actionable = DisplayControllerActionable
    typealias Parameterable = DisplayControllerParameterable
    typealias Viewable = DisplayControllerViewable
    
    // MARK:- Initialiser
    
    required init(actionable: DisplayControllerActionable, parameterable: DisplayControllerParameterable, viewable: DisplayControllerViewable) {
        self.viewable = viewable
        self.actionable = actionable
        self.parameterable = parameterable
    }
    
    // MARK:- Functions

    func viewDidLoad() {
    
    }

}
