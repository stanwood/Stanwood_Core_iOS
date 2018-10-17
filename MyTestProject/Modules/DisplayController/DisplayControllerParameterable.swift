//
//  DisplayControllerParameterable.swift
//  MyTestProject
//
//  Created by AT on 10/17/18.
//  Copyright © 2018 stanwood GmbH. All rights reserved.
//

protocol DisplayControllerParameterable {
    var funkyObjects: FunkyObjects! { get }
}

extension Parameters: DisplayControllerParameterable {
    var funkyObjects: FunkyObjects! {
        return appData.funkyObjects
    }}
