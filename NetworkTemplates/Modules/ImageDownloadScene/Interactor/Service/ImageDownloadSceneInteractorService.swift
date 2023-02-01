//
//  ImageDownloadSceneInteractorService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 26.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol ImageDownloadSceneInteractorServiceType{
    func setupSubscription()
	func downloadImage()
}

class ImageDownloadSceneInteractorService {
	init(withModel model: ImageDownloadSceneViewModelType) {
		self.model = model
	}
	
	private var model: ImageDownloadSceneViewModelType
}

extension ImageDownloadSceneInteractorService: ImageDownloadSceneInteractorServiceType {
    func setupSubscription() {
        model.setupSubscription()
    }
    
    func downloadImage() {
        model.downloadImage()
    }
}
