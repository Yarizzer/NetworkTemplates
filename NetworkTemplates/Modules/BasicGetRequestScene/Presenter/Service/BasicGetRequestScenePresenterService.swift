//
//  BasicGetRequestScenePresenterService.swift
//  NetworkTemplates
//
//  Created by Yaroslav Abaturov on 27.01.2023.
//  Copyright (c) 2023 Yaroslav Abaturov. All rights reserved.
//

protocol BasicGetRequestScenePresenterServiceType{
	var model: BasicGetRequestSceneViewModelType { get }
}

class BasicGetRequestScenePresenterService {
	init(withModel model: BasicGetRequestSceneViewModelType) {
		self.viewModel = model
	}
	
	private var viewModel: BasicGetRequestSceneViewModelType
}

extension BasicGetRequestScenePresenterService: BasicGetRequestScenePresenterServiceType {
	var model: BasicGetRequestSceneViewModelType { return viewModel }
}
