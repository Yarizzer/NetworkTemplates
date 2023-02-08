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
    var progress: Publisher<Double?> { get }
    
    func fetchData()
    func stopDownload()
}

class BackgroundRequestService: NSObject {
    func prepareSession() {
        let configuration = URLSessionConfiguration.background(withIdentifier: Constants.sessionConfigurationID)
        configuration.isDiscretionary = true
        configuration.sessionSendsLaunchEvents = true
        self.bgSession = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }
    //Publishers
    var fileLocation: Publisher<URL?> = Publisher(nil)
    var progress: Publisher<Double?> = Publisher(nil)
    
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
    
    
}

extension BackgroundRequestService {
    private struct Constants {
        static let sessionConfigurationID = "sessionConfigurationID"
        static let urlValue = "https://speed.hetzner.de/100MB.bin"
    }
}
