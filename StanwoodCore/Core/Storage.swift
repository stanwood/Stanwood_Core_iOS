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
            case documents
            
            /// Data that can be downloaded again or regenerated should be stored in the Caches directory.
            case caches
        }
        
        /// Returns URL constructed from specified directory
        static fileprivate func getURL(for directory: Directory) -> URL {
            var searchPathDirectory: FileManager.SearchPathDirectory
            
            switch directory {
            case .documents:
                searchPathDirectory = .documentDirectory
            case .caches:
                searchPathDirectory = .cachesDirectory
            }
            
            if let url = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).first {
                return url
            } else {
                fatalError("Could not create URL for specified directory!")
            }
        }
        
        
        /**
         Store an encodable struct to the specified directory on disk
         
         - Parameters:
         - object: the encodable struct to store
         - directory: where to store the struct
         - fileName: what to name the file where the struct data will be stored
         */
        static open func store<T: Encodable>(_ object: T, to directory: Directory, as fileType: FileType, withName fileName: String) throws {
            let url = getURL(for: directory).appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(object)
                if FileManager.default.fileExists(atPath: url.path) {
                    try FileManager.default.removeItem(at: url)
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
            let url = getURL(for: directory).appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            
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
            let url = getURL(for: directory)
            do {
                let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
                for fileUrl in contents {
                    try FileManager.default.removeItem(at: fileUrl)
                }
            } catch {
                throw error
            }
        }
        
        /// Remove specified file from specified directory
        static open func remove(_ fileName: String, of fileType: FileType, from directory: Directory) throws {
            let url = getURL(for: directory).appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            if FileManager.default.fileExists(atPath: url.path) {
                do {
                    try FileManager.default.removeItem(at: url)
                } catch {
                    throw error
                }
            }
        }
        
        /// Returns BOOL indicating whether file exists at specified directory with specified file name
        static open func fileExists(_ fileName: String, of fileType: FileType, in directory: Directory) -> Bool {
            let url = getURL(for: directory).appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            return FileManager.default.fileExists(atPath: url.path)
        }
    }
}
