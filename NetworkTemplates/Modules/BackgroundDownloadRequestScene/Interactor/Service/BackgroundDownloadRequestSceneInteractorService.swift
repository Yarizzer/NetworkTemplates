//
//  BackgroundDownloadRequestSceneInteractorService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 08.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BackgroundDownloadRequestSceneInteractorServiceType{
    func setupSubscription()
    
	func sendRequest()
}

class BackgroundDownloadRequestSceneInteractorService {
	init(withModel model: BackgroundDownloadRequestSceneViewModelType) {
		self.model = model
	}
    
    func setupSubscription() {
        model.setupSubscription()
    }
	
	private var model: BackgroundDownloadRequestSceneViewModelType
}

extension BackgroundDownloadRequestSceneInteractorService: BackgroundDownloadRequestSceneInteractorServiceType {
    func sendRequest() {
        model.sendRequest()
    }
}
