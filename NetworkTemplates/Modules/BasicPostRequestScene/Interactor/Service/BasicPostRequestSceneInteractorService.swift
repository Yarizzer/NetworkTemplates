//
//  BasicPostRequestSceneInteractorService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicPostRequestSceneInteractorServiceType{
    func setupSubscription()
	func sendRequest()
}

class BasicPostRequestSceneInteractorService {
	init(withModel model: BasicPostRequestSceneViewModelType) {
		self.model = model
	}
	
	private var model: BasicPostRequestSceneViewModelType
}

extension BasicPostRequestSceneInteractorService: BasicPostRequestSceneInteractorServiceType {
    func setupSubscription() {
        model.setupSubscription()
    }
    
    func sendRequest() {
        model.sendRequest()
    }
}
