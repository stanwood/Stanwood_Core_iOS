//
//  Delegateble.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2018 Stanwood GmbH (www.stanwood.io)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// :nodoc:
public protocol ForceDelegateble {}

extension UICollectionViewCell: ForceDelegateble {}
extension UITableViewCell: ForceDelegateble {}

/**
 Delegateble protocol of type `UICollectionViewCell` || `UITableViewCell` used to set a delegate of type AnyObject
 
 #####Example: Delegetable example#####
 ````swift
 protocol ModuleCellOneDelegate: class {
    func didTapEvent()
 }
 
 protocol ModuleCellTwoDelegate: class {
    func didTapEvent()
 }
 
 protocol ModuleCellsDelegate: ModuleCellOneDelegate, ModuleCellTwoDelegate {}

 class ModuleViewController: UIViewController, ModuleCellsDelegate {}
 
 class Cell: UICollectionViewCell: Delegetable {
 
    .....
 
    cell.set(delegate: self) {}
 }
 ````
 
 - SeeAlso:
 
    `Type`
    `DataType`
 */
public protocol Delegateble where Self: ForceDelegateble {
    
    /**
     Set current cell with a delegate
     
     - Parameters:
        - delegate: the delegate class
     */
    func set(delegate: AnyObject)
}
