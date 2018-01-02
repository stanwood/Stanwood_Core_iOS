//
//  UICollectionView+UITableView+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UICollectionView {
    
    /// The center point of `UICollectionView`
    public var centerPoint : CGPoint {
        return CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y);
    }
    
    /**
     Set a `UIRefreshControl`
     
     - Parameters:
        - target: Any?
        - action: The selector action with swipe
        - tintColor: the activity indicator tintColor. default = .white
     
     - Returns:
        `@discardableResult` `UIRefreshControl` which was assigne to `UICollectionView`
     */
    @available(iOS 10.0, *)
    @discardableResult
    public func setRefreshControl(_ target: Any?, with action: Selector, tintColor: UIColor = .white) -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = tintColor
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        self.refreshControl = refreshControl
        return refreshControl
    }
    
    /**
     Register `UICollectionReusableView.Type`'s
     
     - Parameters:
        - headerTypes: `UICollectionViewCell.Type`'s
     
     - SeeAlso: `register(headerType:)`
     */
    public func register(headerTypes: UICollectionReusableView.Type...) {
        headerTypes.forEach(register)
    }
    
    /**
     Register `UICollectionReusableView.Type`
     
     - Parameters:
        - headerType: UICollectionReusableView.Type
     
     - SeeAlso: `register(headerTypes:)`
     */
    public func register(headerType: UICollectionReusableView.Type) {
        let nib = UINib(nibName: headerType.identifier, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerType.identifier)
    }
    
    /**
     Register `UICollectionViewCell.Type`'s
     
     - Parameters:
        - cellTypes: `UICollectionViewCell.Type`'s
     
     - SeeAlso: `register(cellType:)`
     */
    public func register(cellTypes: UICollectionViewCell.Type...) {
        cellTypes.forEach(register)
    }
    
    /**
     Register `UICollectionViewCell.Type`
     
     - Parameters:
        - cellType: UICollectionViewCell.Type
     
    - SeeAlso: `register(cellTypes:)`
     */
    public func register(cellType: UICollectionViewCell.Type) {
        let nib = UINib(nibName: cellType.identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    /**
     Dequeue generic type `element` of `UICollectionViewCell` for `indexPath`
     
     - Parameters:
        - cellType: Element.Type
        - indexPath: cell for `IndexPath`
     */
    public func dequeue<Element: UICollectionViewCell>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
    
    /**
     Dequeue header generic type `element` of `UICollectionReusableView` for `indexPath`
     
     - Parameters:
        - cellType: Element.Type
        - indexPath: header for `IndexPath`
     */
    public func dequeueHeader<Element: UICollectionReusableView>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
    
    /**
     setAutomaticSize will set the estimated item size as `UICollectionViewFlowLayoutAutomaticSize`
     
     - Since: First available in iOS 10.0
     */
    @available(iOS 10.0, *)
    public func setAutomaticSize() {
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }
    
    /**
     Set minimum line and interitem spacing
     
     - Parameters:
        - spacing: The minimum spacing
     */
    public func set(spacing: CGFloat) {
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = spacing
            flowLayout.minimumInteritemSpacing = spacing
        }
    }
}

extension UICollectionReusableView {
    
    /// UICollectionViewCell & UICollectionReusableView identifier
    public static var identifier: String {
        return String(describing: self)
    }
}


extension UITableViewCell {
    
    /// UITableViewCell identifier
    public static var identifier: String {
        return String(describing: self)
    }
}


extension UITableView {
    
    /// Register UITableViewCell type
    public func register(cellType: UITableViewCell.Type) {
        self.register(UINib(nibName: cellType.identifier, bundle: nil), forCellReuseIdentifier: cellType.identifier)
    }
    
    /// Register UITableViewCell types
    public func register(cellTypes: UITableViewCell.Type...) {
        cellTypes.forEach(register)
    }
    
    /**
     Dequeue generic type `element` of `UITableViewCell` for `indexPath`
     
     - Parameters:
        - cellType: Element.Type
        - indexPath: header for `IndexPath`
     */
    public func dequeue<Element: UITableViewCell>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
    
    /// Check if the curent indexPath is valid
    public func isIndexPathValid(_ indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        if indexPath.item >= numberOfRows(inSection: indexPath.section) {
            return false
        }
        
        return true
    }
}
