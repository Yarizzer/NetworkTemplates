//
//  BasicGetRequestSceneInteractorService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicGetRequestSceneInteractorServiceType {
    func setupSubscription()
	func sendRequest()
}

class BasicGetRequestSceneInteractorService {
	init(withModel model: BasicGetRequestSceneViewModelType) {
		self.model = model
	}
	
	private var model: BasicGetRequestSceneViewModelType
}

extension BasicGetRequestSceneInteractorService: BasicGetRequestSceneInteractorServiceType {
    func setupSubscription() {
        model.setupSubscription()
    }
    
    func sendRequest() {
        model.sendRequest()
    }
}
