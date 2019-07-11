//
//  BasePresenter.swift
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


/// `BasePresenter` offers the minimum properties (actions, parameters, view) required for a type conforming to Presentable.
/// The developer should create its own ModulePresenter type simply sublassing BasePresenter. This will avoid lots of boilerplate code and leave ModulePresenter free to contains only the code relevant to the curret module.
class BasePresenter<A, P, V: AnyObject>: Presentable {
    
    /// A value of type Actionable containing all the actions accessible by the current presenter
    public internal(set) var actions: A
    
    /// A value of type Parameterable containing all the data received in input by the current presenter
    public internal(set) var parameters: P
    
    /// A object of type Viewable representing the UI interactions accessible by the current presenter
    public weak internal(set) var view: V?
    

    /// Creates an instance of BasePresenter
    ///
    /// - Parameters:
    ///   - actions: a value containing all the needed actions
    ///   - parameters: a value containing all the needed input data
    ///   - view: an object providing all the needed UI interactions
    public required init(actions: A, parameters: P, view: V) {
        self.actions = actions
        self.parameters = parameters
        self.view = view
    }
    
}
