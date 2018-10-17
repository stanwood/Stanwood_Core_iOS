//
//  UICollectionViewCell+Extension.swift
//  MyTestProject
//
//  Created by AT on 10/17/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

import Foundation


extension UICollectionViewCell {
    
    func supportIOS12SelfSizing(){
        let containerTop = contentView.topAnchor.constraint(equalTo: topAnchor)
        let containerBottom = contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([containerTop, containerBottom])
    }
}
