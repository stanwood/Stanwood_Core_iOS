//
//  String+Extension.swift
//  MyTestProject
//
//  Created by Aaron Mc Tieguy on 10/16/2018.
//  Copyright © 2018 Stanwood. All rights reserved.eserved.
//

import Foundation

extension String {
    
    /// Transformed a String into an array seperated by ,
    var toArray: [String] {
        return components(separatedBy: ", ")
    }
}
