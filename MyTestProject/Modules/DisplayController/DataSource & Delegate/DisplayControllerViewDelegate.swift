//
//  DisplayControllerViewDelegate.swift
//  MyTestProject
//
//  Created by AT on 10/17/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

import StanwoodCore

class DisplayControllerDelegate: CollectionDelegate {

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let item = modelCollection?[indexPath] as? FunkyObject else { return }
        
        print("If this worked then your item is - ", item)
    }
}
