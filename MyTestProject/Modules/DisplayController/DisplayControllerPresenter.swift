//
//  DisplayControllerPresenter.swift
//  MyTestProject
//
//  Created by AT on 10/17/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//


//public protocol MetaModule {
//    associatedtype View where View == Presenter.Viewable
//    associatedtype Action where Action == Presenter.Actionable
//    associatedtype Parameter where Parameter == Presenter.Parameterable
//    associatedtype ViewController: HasPresenter & UIViewController
//    associatedtype Presenter: Presentable where Presenter == ViewController.Presenter
//}
//


enum DisplayControllerMetaModule: MetaModule {
    
    typealias View = DisplayControllerViewable
    
    typealias Action = DisplayControllerActionable
    
    typealias Parameter = DisplayControllerParameterable
    
    typealias ViewController = DisplayControllerViewController
    
    typealias Presenter = DisplayControllerPresenter
}



protocol DisplayControllerViewable: class {
    func setupCollectionView(dataType: ModelCollection?)
}

class DisplayControllerPresenter: Presentable {

    // MARK:- Properties
    
    weak var view: DisplayControllerViewable?
    var actionable: DisplayControllerActionable
    var parameterable: DisplayControllerParameterable
    
    // MARK:- Initialiser
    
    required init(actionable: DisplayControllerActionable, parameterable: DisplayControllerParameterable, viewable: DisplayControllerViewable) {
        self.view = viewable
        self.actionable = actionable
        self.parameterable = parameterable
    }
    
    // MARK:- Functions

    func viewDidLoad() {
        view?.setupCollectionView(dataType: parameterable.funkyObjects)
    }
}
