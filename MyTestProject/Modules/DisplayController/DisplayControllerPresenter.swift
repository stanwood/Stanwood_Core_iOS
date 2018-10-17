//
//  DisplayControllerPresenter.swift
//  MyTestProject
//
//  Created by AT on 10/17/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

protocol DisplayControllerViewable: class {
    func setupCollectionView(dataType: DataType?)
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
        viewable.setupCollectionView(dataType: parameterable.funkyObjects)
    }
}
