//
//  DetailCollectionDataSource.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import StanwoodCore

class DetailCollectionDataSource: Stanwood.AbstractCollectionDataSource {
    
    weak var presenter: DetailCollectionPresenter?
    
    // Let this crash to show how we fix it, /// Remove and add with snippets

    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        fatalError("Not implemented")
//    }
    
}
