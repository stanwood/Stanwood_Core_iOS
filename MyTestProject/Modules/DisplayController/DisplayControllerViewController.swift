//
//  DisplayControllerViewController.swift
//  MyTestProject
//
//  Created by AT on 10/17/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

import UIKit

class DisplayControllerViewController: UIViewController, SourceTypePresentable {
   
    // ---------------- WARNING ---------------- WARNING ---------------- WARNING
    
    // WE NEED TO NOT HAVE THIS BUT THE TUTORIAL LOOKED SUPER SHITTY WITHOUT IT
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    // ---------------- WARNING ---------------- WARNING ---------------- WARNING

    
    
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
        presenter.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension DisplayControllerViewController: DisplayControllerViewable {
    
    func setupCollectionView(dataType: DataType?) {
        
        delegate = DisplayControllerDelegate(dataType: dataType)
        dataSource = DisplayControllerDataSource(dataType: dataType, delegate: self)
        
        collectionView.setAutomaticSize()
        collectionView.register(cellType: DisplayContentCell.self)
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }

}


extension DisplayControllerViewController: DisplayContentCellDelegatge {
    
    func didSelectButton(){
        
        let alert = UIAlertController(title: "It worked! You are great", message: "Maybe even the best", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
