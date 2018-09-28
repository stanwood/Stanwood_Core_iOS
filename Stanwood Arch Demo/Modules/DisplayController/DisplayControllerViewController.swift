//
//  DisplayControllerViewController.swift
//  Stanwood Arch Demo
//
//  Created by AT on 9/28/18.
//  Copyright © 2018 Stanwood. All rights reserved.
//

import UIKit

class DisplayControllerViewController: UIViewController, SourceTypePresentable {
   
    // MARK:- Properties
    
    var presenter: DisplayControllerPresenter!
    var dataSource: DisplayControllerDataSource!
    var delegate: DisplayControllerDelegate!
    
    // MARK:- Outlets

    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK:- Typealias

    typealias DataSource = DisplayControllerDataSource
    typealias Delegate = DisplayControllerDelegate
    
    // MARK:- LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        navigationController?.isNavigationBarHidden = true
        presenter.viewDidLoad()
    }
    
    private func setupCollectionView() {
        
        let source = presenter.parameterable.funkyObjects
       
        delegate = DisplayControllerDelegate(dataType: source)
        dataSource = DisplayControllerDataSource(dataType: source)
        delegate.presenter = presenter
        dataSource.presenter = presenter
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        collectionView.register(cellType: DisplayContentCell.self)
        collectionView.setAutomaticSize()
        collectionView.reloadData()
    }
    
    
    @IBAction func dismiss(_ sender: UIButton) {
        dismissCurrentController()
    }
    
}

extension DisplayControllerViewController: DisplayControllerViewable {
    
}
