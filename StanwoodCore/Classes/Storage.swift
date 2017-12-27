//
//  Storage.swift
//  StanwoodCore
//
//  Created by Tal Zion on 27/12/2017.
//  Copyright © 2017 stanwood GmbH. All rights reserved.
//

import Foundation

open class Stanwood {}

extension Stanwood {
    
    public class Storage {
        
        private init() { }
        
        
        public enum FileType: String {
            case json
        }
        
        public enum Directory {
            // Only documents and other data that is user-generated, or that cannot otherwise be recreated by your application, should be stored in the <Application_Home>/Documents directory and will be automatically backed up by iCloud.
            case documents
            
            // Data that can be downloaded again or regenerated should be stored in the <Application_Home>/Library/Caches directory. Examples of files you should put in the Caches directory include database cache files and downloadable content, such as that used by magazine, newspaper, and map applications.
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
        
        
        /// Store an encodable struct to the specified directory on disk
        ///
        /// - Parameters:
        ///   - object: the encodable struct to store
        ///   - directory: where to store the struct
        ///   - fileName: what to name the file where the struct data will be stored
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
                
                #if DEBUG || BETA
                    print(error)
                #endif
            }
        }
        
        /// Retrieve and convert a struct from a file on disk
        ///
        /// - Parameters:
        ///   - fileName: name of the file where struct data is stored
        ///   - directory: directory where struct data is stored
        ///   - type: struct type (i.e. Message.self)
        /// - Returns: decoded struct model(s) of data
        static open func retrieve<T: Decodable>(_ fileName: String, of fileType: FileType, from directory: Directory, as type: T.Type) -> T? {
            let url = getURL(for: directory).appendingPathComponent(fileName + ".\(fileType.rawValue)", isDirectory: false)
            
            if !FileManager.default.fileExists(atPath: url.path) {
                return nil
            }
            
            if let data = FileManager.default.contents(atPath: url.path) {
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(type, from: data)
                    return model
                } catch {
                    #if DEBUG || BETA
                        print(error)
                    #endif
                }
            } else {
                #if DEBUG || BETA
                    print("No data at \(url.path)!")
                #endif
            }
            
            return nil
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
