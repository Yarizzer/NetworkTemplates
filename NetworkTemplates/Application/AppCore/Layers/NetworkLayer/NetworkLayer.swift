//
//  NetworkLayer.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//

import Foundation

class NetworkLayer {
    init() {
        self.imageRequestService = FetchImageService()
        self.basicRequestService = BasicRequestService()
        self.backgroundRequestService = BackgroundRequestService()
    }
    
    func prepareSession() {
        backgroundRequestService.prepareSession()
    }
    
    func runSubscription() {
        imageRequestService.data.subscribe(self) { [weak self] data in
            self?.imageData.value = data.newValue
        }
        
        basicRequestService.data.subscribe(self) { [weak self] data in
            self?.basicRequestValue.value = data.newValue
        }
        
        backgroundRequestService.progress.subscribe(self) { [weak self] data in
            self?.bgDownloadProgress.value = data.newValue
        }
    }
    
    //Services
    private let imageRequestService: FetchImageServiceType
    private let basicRequestService: BasicRequestServiceType
    private let backgroundRequestService: BackgroundRequestServiceType
    
    //Publishers
    var imageData: Publisher<Data?> = Publisher(nil)
    var basicRequestValue: Publisher<[BasicRequestModel]?> = Publisher(nil)
    var bgDownloadProgress: Publisher<Float?> = Publisher(nil)
}

extension NetworkLayer: NetworkLayerType {
    func call(with action: NetworkLayerActionType) {
        switch action {
        case .fetchImage: imageRequestService.fetchData()
        case .basicGetRequest: basicRequestService.fetchData(for: .get)
        case .basicPostRequest(let data): basicRequestService.fetchData(for: .post(withData: data))
        case .backgroundRequest: backgroundRequestService.fetchData()
        }
    }
}
