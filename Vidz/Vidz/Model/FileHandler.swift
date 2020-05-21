//
//  FileHandler.swift
//  Vidz
//
//  Created by Tanel Teemusk on 20.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import UIKit

class FileHandler: NSObject {

    class func cache(from url: URL, with name: String) {
        let manager = FileManager.default
        guard let cachesDir = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
        
        do {
            let destinationFileUrl = cachesDir.appendingPathComponent(name)
            _ = try? manager.removeItem(at: destinationFileUrl)
            try manager.moveItem(at: url, to: destinationFileUrl)
        } catch let moveError {
            print("\(moveError)")
        }
    }
    
    class func getFileLocation(with urlString: String) -> URL? {
        let manager = FileManager.default
        guard let dir = manager.urls(for: .cachesDirectory, in: .userDomainMask).first,
            let filename = URL(string: urlString)?.lastPathComponent
            else { return URL(string: urlString) }
        
        let url = dir.appendingPathComponent(filename)
        if manager.fileExists(atPath: url.path) {
            return url
        }
        return URL(string: urlString) //If no downloads then use server from server
    }
    
    class func fileExists(with urlString: String) -> Bool {
        let manager = FileManager.default
        guard let dir = manager.urls(for: .cachesDirectory, in: .userDomainMask).first,
            let filename = URL(string: urlString)?.lastPathComponent
            else { return false }
        
        let url = dir.appendingPathComponent(filename)
        return manager.fileExists(atPath: url.path)
    }
    
    class func listCachedFiles() {
        let manager = FileManager.default
        guard let cachesDir = manager.urls(for: .cachesDirectory, in: .userDomainMask).first else { return }
        do {
            let fileURLs = try manager.contentsOfDirectory(at: cachesDir, includingPropertiesForKeys: nil)
            fileURLs.forEach {
                print($0)
            }
        } catch {
            print("Error while enumerating files \(cachesDir.path): \(error.localizedDescription)")
        }
    }
    
}
