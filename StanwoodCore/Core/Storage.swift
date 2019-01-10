//
//  Storage.swift
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
     Storage can be used to save or cache objects that conform to Codable protocl.
     
     - SeeAlso:
     [Codable](https://developer.apple.com/documentation/swift/codable)
     */
    public class Storage {
        
        private init() { }
        
        /**
         Storage errors
         */
        public enum StorageError: Error {
            case couldNotCreatePathURL
        }
        
        /**
         File type, currently supporting .json
         */
        public enum FileType: String {
            
            /// json file type
            case json
        }
        
        /**
         Directory to save data
         */
        public enum Directory {
            
            /// Only documents and other data that is user-generated, should be stored in the Documents directory and will be automatically backed up by iCloud.
            case documents(customDirectory: String?)
            
            /// Data that can be downloaded again or regenerated should be stored in the Caches directory.
            case caches(customDirectory: String?)
            
            /// Data that is user-generated should be stored in the Library directory.
            case library(customDirectory: String?)
        }
        
        /// Returns URL constructed from specified directory
        static fileprivate func getURLComponents(for directory: Directory) throws -> (url: URL, isCustomDirectory: Bool) {
            var searchPathDirectory: FileManager.SearchPathDirectory
            var customDirectory: String?
            
            switch directory {
            case .documents(customDirectory: let directory):
                customDirectory = directory
                searchPathDirectory = .documentDirectory
            case .caches(customDirectory: let directory):
                customDirectory = directory
                searchPathDirectory = .cachesDirectory
            case .library(customDirectory: let directory):
                customDirectory = directory
                searchPathDirectory = .libraryDirectory
            }
            
            guard let url = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).first else {
                throw StorageError.couldNotCreatePathURL
            }
            
            return (url.appendingPathComponent(customDirectory ?? String()), customDirectory == nil ? false : true)
        }
        
        /**
         Store an encodable struct to the specified directory on disk
         
         - Parameters:
         - object: the encodable struct to store
         - directory: where to store the struct
         - fileName: what to name the file where the struct data will be stored
         */
        static open func store<T: Encodable>(_ object: T, to directory: Directory, as fileType: FileType, withName fileName: String) throws {
            let urlComponents = try getURLComponents(for: directory)
            
            
            var url = urlComponents.url.appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(object)
                
                if FileManager.default.fileExists(atPath: url.path) {
                    try FileManager.default.removeItem(at: url)
                } else {
                    try FileManager.default.createDirectory(at: urlComponents.url, withIntermediateDirectories: true, attributes: nil)
                }
                FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
            } catch {
                throw error
            }
        }
        
        /**
         Retrieve and convert a struct from a file on disk
         
         #####Example: A simple `Resort` object#####
         ````swift
         let resorts = retrieve("resorts", of: .json, from: .documents, as: [Resort].self)
         ````
         
         - Parameters:
             - fileName: name of the file where struct data is stored
             - directory: directory where struct data is stored
             - type: struct type (i.e. Message.self)
         - Returns: decoded struct model(s) of data
         */
        static open func retrieve<T: Decodable>(_ fileName: String, of fileType: FileType, from directory: Directory, as type: T.Type) throws -> T? {
            let urlComponents = try getURLComponents(for: directory)
            var url = urlComponents.url.appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            
            if !FileManager.default.fileExists(atPath: url.path) {
                return nil
            }
            
            guard let data = FileManager.default.contents(atPath: url.path) else { return nil }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(type, from: data)
                return model
            } catch {
                throw error
            }
        }
        
        /// Remove all files at specified directory
        static open func clear(_ directory: Directory) throws {
            let urlComponents = try getURLComponents(for: directory)
            do {
                let contents = try FileManager.default.contentsOfDirectory(at: urlComponents.url, includingPropertiesForKeys: nil, options: [])
                for fileUrl in contents {
                    try FileManager.default.removeItem(at: fileUrl)
                }
            } catch {
                throw error
            }
        }
        
        /// Remove specified file from specified directory
        static open func remove(_ fileName: String, of fileType: FileType, from directory: Directory) throws {
            let urlComponents = try getURLComponents(for: directory)
            let url = urlComponents.url.appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            
            if FileManager.default.fileExists(atPath: url.path) {
                do {
                    try FileManager.default.removeItem(at: url)
                } catch {
                    throw error
                }
            }
        }
        
        /// Returns BOOL indicating whether file exists at specified directory with specified file name
        static open func fileExists(_ fileName: String, of fileType: FileType, in directory: Directory) throws -> Bool {
            let urlComponents = try getURLComponents(for: directory)
            let url = urlComponents.url.appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            return FileManager.default.fileExists(atPath: url.path)
        }
    }
}
