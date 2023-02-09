//
//  BackgroundRequestService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//

import Foundation

protocol BackgroundRequestServiceType {
    func prepareSession()
    
    //Publishers
    var fileLocation: Publisher<URL?> { get }
    var progress: Publisher<Float?> { get }
    
    func fetchData()
    func stopDownload()
}

class BackgroundRequestService: NSObject {
    func prepareSession() {
        let cnfg = URLSessionConfiguration.background(withIdentifier: Constants.sessionConfigurationID)
        cnfg.isDiscretionary = true
        cnfg.sessionSendsLaunchEvents = true
        self.bgSession = URLSession(configuration: cnfg, delegate: self, delegateQueue: nil)
    }
    //Publishers
    var fileLocation: Publisher<URL?> = Publisher(nil)
    var progress: Publisher<Float?> = Publisher(nil)
    
    private var bgSession: URLSession?
    private var downloadTask: URLSessionDownloadTask?
}

extension BackgroundRequestService: BackgroundRequestServiceType {
    func fetchData() {
        guard let session = bgSession, let url = URL(string: Constants.urlValue) else { return }
        
        downloadTask = session.downloadTask(with: url)
        downloadTask?.earliestBeginDate = Date().addingTimeInterval(1)
        downloadTask?.countOfBytesClientExpectsToSend = 512
        downloadTask?.countOfBytesClientExpectsToReceive = 100 * 1024 * 1024
        downloadTask?.resume()
    }
    
    func stopDownload() {
        downloadTask?.cancel()
    }
}

extension BackgroundRequestService: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        DispatchQueue.main.async { [weak self] in
            self?.fileLocation.value = location
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        guard totalBytesExpectedToWrite != NSURLSessionTransferSizeUnknown else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.progress.value = Float(Double(totalBytesWritten)/Double(totalBytesExpectedToWrite))
        }
    }
}

extension BackgroundRequestService {
    private struct Constants {
        static let sessionConfigurationID = "sessionConfigurationID"
        static let urlValue = "http://speedtest.ftp.otenet.gr/files/test100Mb.db"
    }
}
