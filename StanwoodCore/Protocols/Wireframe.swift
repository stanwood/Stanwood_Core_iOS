//
//  Wireframe.swift
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

import UIKit


/// This generic class provide a way of instantiating all the objects needed for a given module.
///
/// ```
/// // Example:
/// let homeViewController = Wireframe<HomeMetaModule>.makeViewController()
/// ```
public class Wireframe<M: MetaModule> {

    /// - Returns: a view controller having the correct type for the current module
    public static func makeViewController() -> M.ViewController {
        return UIStoryboard(name: M.ViewController.self.identifier, bundle: nil).instantiate(viewController: M.ViewController.self)
    }

    /// Creates a Presenter having the correct type for the current module and connects it to the view controller
    ///
    /// - Parameters:
    ///   - viewController: the view controller for the current module
    ///   - view: the view (usually the view controller) for the current module
    ///   - actions: the actions for the current module
    ///   - parameters: the parameters for the current module
    public static func prepare(viewController: M.ViewController,
                        view: M.View,
                        actions: M.Action,
                        parameters: M.Parameter) {
        let presenter = M.Presenter.make(actions: actions, parameters: parameters, view: view)
        viewController.presenter = presenter
    }
}



