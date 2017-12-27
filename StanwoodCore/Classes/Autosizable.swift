//
//  Autosizable.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation
import UIKit

/*
 if let flowLayout = viewController.collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
 flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
 }
 */

///
/// Protocol auto size the cell to the device width
/// Note: collectionView.collectionViewLayout estimatedItemSize should equal to UICollectionViewFlowLayoutAutomaticSize
///
/// **available** iOS 10 and above
/// Note> Only supports portraite atm. Landscape is still in R&D
///
@available(iOS 10.0, *)
protocol AutoSizeable {
    var widthConstraint: NSLayoutConstraint? { get set }
    func autoSize() -> NSLayoutConstraint?
}

@available(iOS 10.0, *)
extension AutoSizeable where Self: UICollectionViewCell {
    
    /// Call when device rotates
    @discardableResult
    func autoSize() -> NSLayoutConstraint? {
        
        guard self.widthConstraint == nil else {
            self.widthConstraint?.constant = UIScreen.main.bounds.width
            updateConstraintsIfNeeded()
            return self.widthConstraint
        }
        
        let widthContainerView = UIView()
        widthContainerView.backgroundColor = .clear
        widthContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(widthContainerView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = widthContainerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        NSLayoutConstraint.activate([
            widthContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            widthContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            widthContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            widthContainerView.heightAnchor.constraint(equalToConstant: 1),
            widthConstraint
            ])
        
        return widthConstraint
    }
}

extension Stanwood {
    
    /// Inherit AutoSizeableCell to conform to Autosizable protocol
    @available(iOS 10.0, *)
    public class AutoSizeableCell: UICollectionViewCell, AutoSizeable {
        
        /// Support for device rotation
        var widthConstraint: NSLayoutConstraint? /// Internal for RnD purpuses
        
        override public func awakeFromNib() {
            super.awakeFromNib()
            
            widthConstraint = autoSize()
            prepare()
        }
        
        override public func prepareForReuse() {
            super.prepareForReuse()
            prepare()
        }
        
        /// Override prepare to reuse the cell
        public func prepare() {
            // Override to prepare cell for reuse
        }
    }
    
}
