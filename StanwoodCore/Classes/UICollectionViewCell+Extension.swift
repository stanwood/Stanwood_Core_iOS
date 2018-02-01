//
//  UICollectionViewCell+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 01/02/2018.
//

import Foundation

extension UICollectionViewCell {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        prepare()
    }
    
    override open func prepareForReuse() {
        super.prepareForReuse()
        prepare()
    }
    
    /**
     Override prepare to reuse the cell.
     Called in `awakeFromNib()` and `prepareForReuse()`
     
        >Note: Override is required
     */
    open func prepare() {
        // Override to prepare cell for reuse
    }
}
