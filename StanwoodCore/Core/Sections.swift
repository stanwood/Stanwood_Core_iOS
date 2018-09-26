//
//  Sections.swift
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

extension Stanwood {
    
    /**
     Sections holds an array of DataTypes.
     
     #####Example: DataSource and Delegate design#####
     
     ````swift
     let itemsOne = [Deal(id: "1"), Deal(id: "2")]
     let itemsTwo = [Meal(id: "pizza"), Meal(id: "ham")]
     
     let sectionOnce = Stanwoon.Elements<Deal>(items: itemsOne)
     let sectionTwo = Stanwoon.Elements<Meal>(items: itemsTwo)
     
     self.sections = Stanwood.Sections(items: [sectionOnce, sectionTwo])
     
     self.dataSource = SectionsDataSource(dataObject: self.sections)
     self.delegate = SectionsDelegate(dataObject: self.sections)
     
     self.collectionView.dataSource = self.dataSource
     self.collectionView.delegate = self.delegate
     ````
     
     - SeeAlso:
     
     `DataType`
     
     `Type`
     
     `Typeable`
     */
    open class Sections: DataType {
        
        // MARK: Properties
        
        /// Items of DataType
        public typealias Section = DataType & Codable
        public var sections: [Section]
        
        // MARK Computet Properties
        
        /// Number of items
        open var numberOfItems: Int {
            return sections[0].numberOfItems
        }
        
        /**
         Sections only supports a single section.
         
         - Returns: current section
         
         - SeeAlso: `DataType` for multiple section option
         */
        open var numberOfSections: Int {
            return sections.count
        }
        
        // MARK: Initializers
        
        /**
         Initializer of Sections
         
         - Parameters:
            - items: `[Section]<Type & Equatable & Codable>`
         */
        public init(items: [Section]) {
            self.sections = items
        }
        
        // MARK: Subsripts
        
        /**
         Subscript to get an item in row.
         
         - Parameters:
            - indexPath: IndexPath location of an item at row
         
         - Returns: `Optional<Type>`
         
         - SeeAlso: `Type`
         */
        open subscript(indexPath: IndexPath) -> Type? {
            return self[indexPath.section][indexPath]
        }
        
        /**
         Subscript to get a section.
         
         >Important: `Sections` only supports a single section dataType. For a more complex solution, please conform to the `DataType` protocol.
         
         - SeeAlso: `DataType`
         */
        open subscript(section: Int) -> DataType {
            return sections[section]
        }
        
        // MARK: Public Functions
        
        /// Returns the cell type at indexPath
        open func cellType(forItemAt indexPath: IndexPath) -> Fillable.Type? {
            return sections[indexPath.section].cellType(forItemAt: indexPath)
        }
    }
}

