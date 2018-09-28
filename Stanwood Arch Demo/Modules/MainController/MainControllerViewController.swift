//
//  MainControllerViewController.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

class MainControllerViewController: UIViewController {
    
    
    var presenter: MainControllerPresenter!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    
    @IBAction func loadExampleController(_ sender: UIButton) {
        presenter.actionable.loadDetailController()
    }
}

extension MainControllerViewController: MainControllerViewable {
    
}
