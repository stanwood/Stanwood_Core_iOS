//
//  UICollectionView+UITableView+Extension.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

extension UICollectionView {
    
    var centerPoint : CGPoint {
        return CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y);
    }
    
    var centerCellIndexPath: IndexPath? {
        return indexPathForItem(at: centerPoint)
    }
    
    @discardableResult
    func setRefreshControl(_ target: Any?, with action: Selector) -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(target, action: action, for: .valueChanged)
        self.refreshControl = refreshControl
        
        return refreshControl
    }
    
    func register(cellType: UICollectionViewCell.Type) {
        let nib = UINib(nibName: cellType.identifier, bundle: nil)
        register(nib, forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func register(headerTypes: UICollectionReusableView.Type...) {
        headerTypes.forEach(register)
    }
    
    func register(headerType: UICollectionReusableView.Type) {
        let nib = UINib(nibName: headerType.identifier, bundle: nil)
        register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerType.identifier)
    }
    
    func register(cellTypes: UICollectionViewCell.Type...) {
        cellTypes.forEach(register)
    }
    
    func dequeue<Element: UICollectionViewCell>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
    
    
    func dequeueHeader<Element: UICollectionReusableView>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
    
    // MARK: - UICollectionViewFlowLayoutAutomaticSize
    @available(iOS 10.0, *)
    func setAutomaticSize() {
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        }
    }
    
    func set(spacing: CGFloat) {
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = spacing
            flowLayout.minimumInteritemSpacing = spacing
        }
    }
}

extension UICollectionReusableView {
    public static var identifier: String {
        return String(describing: self)
    }
}


extension UITableViewCell {
    public static var identifier: String {
        return String(describing: self)
    }
}


extension UITableView {
    
    func register(cellType: UITableViewCell.Type) {
        self.register(UINib(nibName: cellType.identifier, bundle: nil), forCellReuseIdentifier: cellType.identifier)
    }
    
    func register(cellTypes: UITableViewCell.Type...) {
        cellTypes.forEach(register)
    }

    func dequeue<Element: UITableViewCell>(cellType: Element.Type, for indexPath: IndexPath) -> Element {
        let cell = dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
        
        guard let element = cell as? Element else {
            fatalError("Cell \(cell) cannot be casted as \(cellType.identifier)")
        }
        
        return element
    }
    
    func isIndexPathValid(_ indexPath: IndexPath) -> Bool {
        if indexPath.section >= numberOfSections {
            return false
        }
        if indexPath.item >= numberOfRows(inSection: indexPath.section) {
            return false
        }
        
        return true
    }
}
