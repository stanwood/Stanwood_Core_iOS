//
//  ViewController.swift
//  StanwoodCore
//
//  Created by Tal Zion on 10/09/2017.
//  Copyright (c) 2017 Tal Zion. All rights reserved.
//

import UIKit
import StanwoodCore

extension UIImage {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public convenience init?(named: String) {
        self.init(named: named)
        accessibilityIdentifier = named
    }
    
    public convenience init(imageLiteralResourceName name: String) {
        self.init(imageLiteralResourceName: name)
        accessibilityIdentifier = name
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.localizedText = ""
        
        let button = UIButton()
        let image = #imageLiteral(resourceName: "open")
//        button.set(image: image, for: .normal)
    }
}

