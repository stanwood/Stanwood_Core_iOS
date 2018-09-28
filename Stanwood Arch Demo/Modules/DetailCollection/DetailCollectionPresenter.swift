//
//  DetailCollectionPresenter.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

protocol DetailCollectionViewable: class {
    
}

class DetailCollectionPresenter: Presentable {
    
    // MARK:- Properties
    
    unowned var viewable: DetailCollectionViewable
    var actionable: DetailCollectionActionable
    var parameterable: DetailCollectionParameterable

    // MARK:- Typealias
    
    typealias Actionable = DetailCollectionActionable
    typealias Parameterable = DetailCollectionParameterable
    typealias Viewable = DetailCollectionViewable
    
    // MARK:- Initialiser
    
    required init(actionable: DetailCollectionActionable, parameterable: DetailCollectionParameterable, viewable: DetailCollectionViewable) {
        self.viewable = viewable
        self.actionable = actionable
        self.parameterable = parameterable
    }
    
    // MARK:- Functions

    func viewDidLoad() {
    
    }

}
