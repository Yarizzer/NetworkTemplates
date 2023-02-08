//
//  UploadImageScenePresenterService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 02.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol UploadImageScenePresenterServiceType{
	var model: UploadImageSceneViewModelType { get }
}

class UploadImageScenePresenterService {
	init(withModel model: UploadImageSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: UploadImageSceneViewModelType
}

extension UploadImageScenePresenterService: UploadImageScenePresenterServiceType {
	var model: UploadImageSceneViewModelType { return viewModel }
}
