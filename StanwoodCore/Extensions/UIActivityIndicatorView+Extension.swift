//
//  UIActivityIndicatorView+Extension.swift
//  Custom Transitions
//
//  Created by Aaron Tredrea on 27/11/2018.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation



extension UIActivityIndicatorView {
    
    func show(_ show: Bool) {
        
        main { [weak self] in
            
            switch show {
            case true:
                self?.startAnimating()
            case false:
                self?.stopAnimating()
            }
        }
    }
}
