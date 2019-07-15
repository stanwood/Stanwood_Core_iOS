//
//  MetaModule.swift
//
//  The MIT License (MIT)
//
//  Copyright (c) 2019 Stanwood GmbH (www.stanwood.io)
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

/// This protocol represents the connection between the main types of a Module. It brings at compile time a series of consistency checks like the following:
/// - the Action of a module must be the same type of *Presenter.Actionable* of the same module
/// - the ViewController of a module must conform to *HasPresenter*
/// - the Presenter of a module cannot be connected to the view controller of another module
///
/// In other words this protocol is the *glue* which connects all the main types of a Module.
/// More details
/// - View: represents the View protocol of a module and is constrained to be the same of *Presenter.Viewable*
/// - Action: represents the Action type of a module and is constrained to be the same of *Presenter.Actionable*
/// - Parameter: represents the Parameter type of a module and is constrained to be the same of *Presenter.Parameter*
/// - ViewController: represents the *UIViewController* of the current module which also must conform to *HasPresenter*
/// - Presenter: represents the *Presenter* type of the current module which is constrained to be the same of *ViewController.Presenter*
public protocol MetaModule {
    associatedtype View where View == Presenter.Viewable
    associatedtype Action where Action == Presenter.Actionable
    associatedtype Parameter where Parameter == Presenter.Parameterable
    associatedtype ViewController: HasPresenter & UIViewController
    associatedtype Presenter: Presentable where Presenter == ViewController.Presenter
    
}
