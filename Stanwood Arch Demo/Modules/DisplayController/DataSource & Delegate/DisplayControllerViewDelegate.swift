//
//  DisplayControllerViewDelegate.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import StanwoodCore

class DisplayControllerDelegate: Stanwood.AbstractCollectionDelegate {
    
    weak var presenter: DisplayControllerPresenter?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard
            let item = dataType?[indexPath] as? FunkyObject,
            let id = item.id,
            let awesomeObject = presenter?.parameterable.item(with: id)
        else { return }
        
        /// This can be an array or a single item, to get the most from this example, we have implimented a collection
        presenter?.actionable.showItemWith(items: AwesomeDisplayItems(items: [awesomeObject]))
    }
    
}
