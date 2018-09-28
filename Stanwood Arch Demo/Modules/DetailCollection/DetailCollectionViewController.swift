//
//  DetailCollectionViewController.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

class DetailCollectionViewController: UIViewController, SourceTypePresentable {
    
    // MARK:- Properties
    
    var presenter: DetailCollectionPresenter!
    var dataSource: DetailCollectionDataSource!
    var delegate: DetailCollectionDelegate!
    
    // MARK:- Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK:- Typealias
    
    typealias DataSource = DetailCollectionDataSource
    typealias Delegate = DetailCollectionDelegate
    
    // MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.viewDidLoad()
    }
    /// Remove and add with snippets
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupCollectionView() {
        
        let source = presenter.parameterable.items
        
        delegate = DetailCollectionDelegate(dataType: source)
        dataSource = DetailCollectionDataSource(dataType: source, delegate: self)
        delegate.presenter = presenter
        dataSource.presenter = presenter
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.setAutomaticSize()
        collectionView.register(cellType: DetailCell.self)
        collectionView.reloadData()
    }
    
}

extension DetailCollectionViewController: DetailCollectionViewable {
    /// Remove and add with snippets
    /// In the video, add a show/hide spinner here to demo viewable
}

extension DetailCollectionViewController: DetailCellDelegatge {
    /// Remove and add with snippets
    func didSelectButton(){
        
        let alert = UIAlertController(title: "It worked! You are great", message: "Maybe even the best", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
