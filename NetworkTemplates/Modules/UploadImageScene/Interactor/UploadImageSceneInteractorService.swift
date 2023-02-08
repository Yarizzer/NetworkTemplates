//
//  UploadImageSceneInteractorService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol UploadImageSceneInteractorServiceType{
	
}

class UploadImageSceneInteractorService {
	init(withModel model: UploadImageSceneViewModelType) {
		self.model = model
	}
	
	private var model: UploadImageSceneViewModelType
}

extension UploadImageSceneInteractorService: UploadImageSceneInteractorServiceType {
	
}
