//
//  UICollectionViewCell+Extension.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import Foundation

extension UICollectionViewCell {
    
    func supportIOS12SelfSizing(){
        let containerTop = contentView.topAnchor.constraint(equalTo: topAnchor)
        let containerBottom = contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        NSLayoutConstraint.activate([containerTop, containerBottom])
    }
}
