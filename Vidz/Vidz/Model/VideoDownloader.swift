//
//  VideoDownloader.swift
//  Vidz
//
//  Created by Tanel Teemusk on 20.05.2020.
//  Copyright © 2020 Teemusk. All rights reserved.
//

import Foundation
import Combine

class Progress: ObservableObject {
    @Published var progress: Float = 0 {
        willSet {
            print("Setting progress \(progress)")
        }
    }
}

class VideoDownloader: NSObject, URLSessionDownloadDelegate, URLSessionTaskDelegate {
    private var urlSession: URLSession?
    private var downloadTask: URLSessionDownloadTask?
    @Published var progress = Progress()
    private var completion: (() -> Void)?
    
    override init() {
        super.init()
    }
    func load(from urlString: String, onCompletion: @escaping () -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue.main)
            
        let downloadTask = session.downloadTask(with: url)
        downloadTask.resume()
        
        self.urlSession = session
        self.downloadTask = downloadTask
        self.completion = onCompletion
    }
    
    func cancel() {
        self.downloadTask?.cancel()
        self.urlSession = nil
        self.downloadTask = nil
    }
  
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        guard let filename = downloadTask.currentRequest?.url?.lastPathComponent
               else { return }
        FileHandler.cache(from: location, with: filename)
        completion?()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        progress.progress = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
    }
    
}
