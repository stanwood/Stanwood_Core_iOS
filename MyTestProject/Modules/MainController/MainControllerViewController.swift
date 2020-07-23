//
//  MainControllerViewController.swift
//  MyTestProject
//
//  Created by AT on 10/16/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

import UIKit

class MainControllerViewController: UIViewController {
    var presenter: MainControllerPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func doStuff(_ sender: Any) {
        presenter.actions.loadDisplayController()
    }
    
}

extension MainControllerViewController: MainControllerViewable {
    
}
