//
//  DetailCollectionWireframe.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

class DetailCollectionWireframe {
    
    static func makeViewController() -> DetailCollectionViewController {
    	return UIStoryboard.instantiate(viewController: DetailCollectionViewController.self)
    }
    
    static func prepare(_ viewController: DetailCollectionViewController, with  actions: DetailCollectionActionable, and parameters: DetailCollectionParameterable) {
    	let presenter =  DetailCollectionPresenter(actionable: actions, parameterable: parameters, viewable: viewController)
        viewController.presenter = presenter
    }
    
}
