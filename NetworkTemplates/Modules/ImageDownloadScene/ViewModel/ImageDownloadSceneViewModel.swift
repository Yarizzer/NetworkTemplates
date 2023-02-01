//
//  ImageDownloadSceneViewModel.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

import Foundation

protocol ImageDownloadSceneViewModelType {
    func setupSubscription()
    
    var didFetchedData: Publisher<Bool?> { get }
    
    var sceneTitle: String { get }
    var imageData: Data? { get }
    
    func downloadImage()
}

class ImageDownloadSceneViewModel {
    func setupSubscription() {
        AppCore.shared.networkLayer.imageData.subscribe(self) { [weak self] data in
            self?.data = data.newValue
        }
    }
    
    private var data: Data? {
        didSet {
            didFetchedData.value = true
        }
    }
    
    var didFetchedData: Publisher<Bool?> = Publisher(nil)
}

extension ImageDownloadSceneViewModel: ImageDownloadSceneViewModelType {
    var sceneTitle: String { return Constants.sceneTitleValue }
    
    var imageData: Data? { return data }
    
    func downloadImage() {
        AppCore.shared.networkLayer.call(with: .fetchImage)
    }
}

extension ImageDownloadSceneViewModel {
    private struct Constants {
        static let sceneTitleValue = "Image download scene"
    }
}
