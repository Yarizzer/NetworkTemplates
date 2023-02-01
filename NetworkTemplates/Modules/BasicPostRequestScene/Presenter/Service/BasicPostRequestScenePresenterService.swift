//
//  BasicPostRequestScenePresenterService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 01.02.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicPostRequestScenePresenterServiceType{
	var model: BasicPostRequestSceneViewModelType { get }
}

class BasicPostRequestScenePresenterService {
	init(withModel model: BasicPostRequestSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: BasicPostRequestSceneViewModelType
}

extension BasicPostRequestScenePresenterService: BasicPostRequestScenePresenterServiceType {
	var model: BasicPostRequestSceneViewModelType { return viewModel }
}
